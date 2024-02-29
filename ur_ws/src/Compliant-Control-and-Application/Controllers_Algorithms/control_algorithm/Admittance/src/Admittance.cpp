#include <Admittance/Admittance.h>
#include<vector>

bool flag = true;

Admittance::Admittance(ros::NodeHandle &n,
    double frequency,
    std::string topic_arm_state,
    std::string topic_arm_command,
    std::string topic_wrench_state,
    std::vector<double> M,
    std::vector<double> D,
    std::vector<double> K,
    std::vector<double> desired_pose,
    std::string base_link,
    std::string end_link,
    double arm_max_vel,
    double arm_max_acc) :
  nh_(n), loop_rate_(frequency),
  M_(M.data()), D_(D.data()),K_(K.data()),desired_pose_(desired_pose.data()),
  arm_max_vel_(arm_max_vel), arm_max_acc_(arm_max_acc),
  base_link_(base_link), end_link_(end_link){

  //* Subscribers
  sub_arm_state_           = nh_.subscribe(topic_arm_state, 5, 
      &Admittance::state_arm_callback, this,ros::TransportHints().reliable().tcpNoDelay());
  sub_wrench_state_        = nh_.subscribe(topic_wrench_state, 5,
      &Admittance::state_wrench_callback, this, ros::TransportHints().reliable().tcpNoDelay());
  
  //* Publishers
  pub_arm_cmd_              = nh_.advertise<geometry_msgs::Twist>(topic_arm_command, 5);

  // initializing the class variables
  arm_position_.setZero();
  arm_twist_.setZero();
  wrench_external_.setZero();
  desired_wrench_.setZero();
  Phi.setZero();
  desired_pose_position_ << desired_pose_.topRows(3);
  desired_pose_orientation_.coeffs() << desired_pose_.bottomRows(4)/desired_pose_.bottomRows(4).norm();
  flag = 0;

  while (nh_.ok() && !arm_position_(0)) {
    ROS_WARN_THROTTLE(1, "Waiting for the state of the arm...");
    ros::spinOnce();
    loop_rate_.sleep();
  }

  // Init integrator
  arm_desired_twist_adm_.setZero();


  ft_arm_ready_ = false;
  base_world_ready_ = false;
  world_arm_ready_ = false;

  wait_for_transformations();
}

//!-                   INITIALIZATION                    -!//

void Admittance::wait_for_transformations() {
  tf::TransformListener listener;
  Matrix6d rot_matrix;
  // Makes sure all TFs exists before enabling all transformations in the callbacks
  // while (!get_rotation_matrix(rot_matrix, listener, "world", base_link_)) {sleep(1);}
  base_world_ready_ = true;
  // while (!get_rotation_matrix(rot_matrix, listener, base_link_, "world")) {sleep(1);}
  world_arm_ready_ = true;
  while (!get_rotation_matrix(rot_matrix, listener, base_link_, end_link_)) {sleep(1);}
  ft_arm_ready_ = true;
  ROS_INFO("The Force/Torque sensor is ready to use.");
}

//!-                    CONTROL LOOP                     -!//

void Admittance::run() {

  ROS_INFO("Running the admittance control loop .................");

  while (nh_.ok()) {

    compute_admittance();

    send_commands_to_robot();

    ros::spinOnce();
    loop_rate_.sleep();
  }
}

//!-                Admittance Dynamics                  -!//

void Admittance::compute_admittance() {
  Matrix6d rotation_ft_base;
  desired_wrench_.setZero();
  desired_wrench_(2) = -10;
  error.topRows(3) = arm_position_ - desired_pose_position_;
  if(desired_pose_orientation_.coeffs().dot(arm_orientation_.coeffs()) < 0.0)
  {
    arm_orientation_.coeffs() << -arm_orientation_.coeffs();
  }
  Eigen::Quaterniond quat_rot_err (arm_orientation_ * desired_pose_orientation_.inverse());
  if(quat_rot_err.coeffs().norm() > 1e-3)
  {
    quat_rot_err.coeffs() << quat_rot_err.coeffs()/quat_rot_err.coeffs().norm();
  }
  Eigen::AngleAxisd err_arm_des_orient(quat_rot_err);
  error.bottomRows(3) << err_arm_des_orient.axis() * err_arm_des_orient.angle();

  // Translation error w.r.t. desired equilibrium
    Vector6d coupling_wrench_arm;
    // desired_wrench_ << rotation_ft_base * desired_wrench_;
    // Phi = Phi - 0.01 * D_.inverse() * (desired_wrench_ - wrench_external_);
    // coupling_wrench_arm = D_ * (arm_desired_twist_adm_) + D_ * Phi + K_*error;
    coupling_wrench_arm = D_ * (arm_desired_twist_adm_) + K_*error;
    get_rotation_matrix(rotation_ft_base, listener_ft_, base_link_, end_link_);
    desired_wrench_ << rotation_ft_base * desired_wrench_;
    wrench_external_<< rotation_ft_base * wrench_external_;

    arm_desired_accelaration = M_.inverse() * ( - coupling_wrench_arm  + wrench_external_ - desired_wrench_);
  // Integrate for velocity based interface

  ros::Duration duration = loop_rate_.expectedCycleTime();
  arm_desired_twist_adm_ += arm_desired_accelaration * duration.toSec();
}

//!-                     CALLBACKS                       -!//

void Admittance::state_arm_callback(
  const cartesian_state_msgs::PoseTwistConstPtr msg) {
  arm_position_ <<  msg->pose.position.x,
                    msg->pose.position.y, 
                    msg->pose.position.z;

  arm_orientation_.coeffs() <<  msg->pose.orientation.x,
                                msg->pose.orientation.y,
                                msg->pose.orientation.z,
                                msg->pose.orientation.w;

  arm_twist_ << msg->twist.linear.x, 
                msg->twist.linear.y,
                msg->twist.linear.z,
                msg->twist.angular.x,
                msg->twist.angular.y,
                msg->twist.angular.z;
}

void Admittance::state_wrench_callback(
  const geometry_msgs::WrenchStampedConstPtr msg) {
  Vector6d wrench_ft_frame;
  Matrix6d rotation_ft_base;

    wrench_ft_frame <<  msg->wrench.force.x,msg->wrench.force.y,msg->wrench.force.z,0,0,0;
    // 它的期望力似乎是定义在基坐标系下，需要把力转换下
    // 下面这个函数求的是传感器坐标系到基坐标系下的变换
    // get_rotation_matrix(rotation_ft_base, listener_ft_, base_link_, end_link_);
    // wrench_external_ <<  rotation_ft_base * wrench_ft_frame;
    wrench_external_ <<  wrench_ft_frame;
    double error=wrench_external_(2)-10; // 代表稳定？
    if(abs(error)<1) flag++;
    // std::cout<<wrench_external_(2)<<" "<<flag<<std::endl;
}

//!-               COMMANDING THE ROBOT                  -!//

void Admittance::send_commands_to_robot() {
  geometry_msgs::Twist arm_twist_cmd;


  // std::cout<<wrench_external_(2)<<std::endl;


  if(flag>200){

    arm_twist_cmd.linear.x  = 0.05 * arm_desired_twist_adm_(0) ; // 这个地方可以用wrench_external判断一下
    arm_twist_cmd.linear.y  =  0.05 * arm_desired_twist_adm_(1);
    arm_twist_cmd.linear.z  = 0.05 * arm_desired_twist_adm_(2) ;

    arm_twist_cmd.angular.x = 0;
    arm_twist_cmd.angular.y = 0;
    arm_twist_cmd.angular.z = 0;
    pub_arm_cmd_.publish(arm_twist_cmd);
  } else {
    arm_twist_cmd.linear.x  = 0.05 * arm_desired_twist_adm_(0) ; // 这个地方可以用wrench_external判断一下
    arm_twist_cmd.linear.y  =  0.05 * arm_desired_twist_adm_(1);
    arm_twist_cmd.linear.z  = 0.05 * arm_desired_twist_adm_(2) ;
    arm_twist_cmd.angular.x = 0;
    arm_twist_cmd.angular.y =  0;
    arm_twist_cmd.angular.z =  0;
    pub_arm_cmd_.publish(arm_twist_cmd);
  }
    //std::cout<<flag<<" "<<idx<<" "<<arm_twist_cmd.linear.x<<" "<<arm_twist_cmd.linear.y<<" "<<arm_twist_cmd.linear.z<<" "<<arm_twist_cmd.angular.x<<" "<<arm_twist_cmd.angular.y<<" "<<arm_twist_cmd.angular.z<<std::endl;
}

//!-                    UTILIZATION                      -!//

bool Admittance::get_rotation_matrix(Matrix6d & rotation_matrix,
    tf::TransformListener & listener,
    std::string from_frame,
    std::string to_frame) {
  tf::StampedTransform transform;
  Matrix3d rotation_from_to;
  try {
    listener.lookupTransform(from_frame, to_frame,
                            ros::Time(0), transform);
    tf::matrixTFToEigen(transform.getBasis(), rotation_from_to);
    // std::cout<<rotation_from_to<<std::endl;
    rotation_matrix.setZero();
    rotation_matrix.topLeftCorner(3, 3) = rotation_from_to;
    rotation_matrix.bottomRightCorner(3, 3) = rotation_from_to;
  }
  catch (tf::TransformException ex) {
    rotation_matrix.setZero();
    ROS_WARN_STREAM_THROTTLE(1, "Waiting for TF from: " << from_frame << " to: " << to_frame );
    return false;
  }
  return true;
}

