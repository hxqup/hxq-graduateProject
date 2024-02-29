// #include <moveit/move_group_interface/move_group_interface.h>

// int main(int argc, char **argv)
// {
//   ros::init(argc, argv, "moveit_custom_demo");
//   ros::NodeHandle node_handle; 
//   ros::AsyncSpinner spinner(1);
//   spinner.start();

//   moveit::planning_interface::MoveGroupInterface group("manipulator");


//   // 获取机械臂的当前姿态
//   geometry_msgs::PoseStamped current_pose = group.getCurrentPose();
//   // 设置机器人终端的目标位置
//   geometry_msgs::Pose target_pose1;
//   // target_pose1.orientation.w = 0.131;
//   // target_pose1.orientation.x= 0.991;
//   // target_pose1.orientation.y = -0.035;
//   // target_pose1.orientation.z = -0.001;

//   // target_pose1.position.x = -0.241;
//   // target_pose1.position.y =-0.031;
//   // target_pose1.position.z = 0.055;
//   target_pose1.orientation.x= 0;
//   target_pose1.orientation.y = 1;
//   target_pose1.orientation.z = -0.055;
//   target_pose1.orientation.w = 0;

//   // target_pose1.position.x = -0.552;
//   target_pose1.position.x =-0.575; 
//   target_pose1.position.y =-0.312;
//   target_pose1.position.z = 0.312;
//   group.setPoseTarget(target_pose1);

//   // 进行运动规划，计算机器人移动到目标的运动轨迹，此时只是计算出轨迹，并不会控制机械臂运动
//   moveit::planning_interface::MoveGroupInterface::Plan my_plan;
//   moveit::planning_interface::MoveItErrorCode success = group.plan(my_plan);

//   ROS_INFO("Visualizing plan 1 (pose goal) %s",success?"":"FAILED");   

//   //让机械臂按照规划的轨迹开始运动。
//   if(success)
//       group.execute(my_plan);

//   ros::shutdown(); 
//   return 0;
// }

#include<math.h>
#include<ros/ros.h>
#include<moveit/move_group_interface/move_group_interface.h>
#include<moveit/robot_trajectory/robot_trajectory.h>
#include <tf/transform_datatypes.h>
#include<tf/tf.h>

int main(int argc, char **argv)
{
    ros::init(argc,argv,"moveit_circle_demo");
    ros::AsyncSpinner spinner(1);
    spinner.start();

    moveit::planning_interface::MoveGroupInterface arm("manipulator");
    std::string end_effector_link = arm.getEndEffectorLink();
    std::string reference_frame = "base_link";
    arm.setPoseReferenceFrame(reference_frame);

    //当运动规划失败后，允许重新规划
    arm.allowReplanning(true);

    //设置位置(单位：米)和姿态（单位：弧度）的允许误差
    arm.setGoalPositionTolerance(0.0001);
    arm.setGoalOrientationTolerance(0.001);

    //设置允许的最大速度和加速度
    arm.setMaxAccelerationScalingFactor(0.8);
    arm.setMaxVelocityScalingFactor(0.8);

    // 设置机器人终端的目标位置
    geometry_msgs::PoseStamped current_pose = arm.getCurrentPose();
    geometry_msgs::Pose target_pose;//设定圆心的位置
    // target_pose.orientation.x = 3.51569876894e-07;
    // target_pose.orientation.y = 0.995037100326;
    // target_pose.orientation.z = 0.0995046174335;
    // target_pose.orientation.w = 9.22188556025e-06;

    // double roll  = 2.9774779827700106;
    // double pitch = -0.09657948597260312;
    // double yaw = -0.09657948597260312;
    // tf::Quaternion quat;
    // quat.setRPY(row, pitch, yaw);

    target_pose.orientation.x = 0;
    target_pose.orientation.y = 1;
    target_pose.orientation.z = 0;
    target_pose.orientation.w =  0;
    //std::cout<<"orientation.x"<<target_pose.orientation.x<<" "<<target_pose.orientation.y<<" "<<target_pose.orientation.z<<" "<<target_pose.orientation.w<<std::endl;

    target_pose.position.x = -0.469157679646;
    target_pose.position.y = -0.372224246493;
    target_pose.position.z = 0.323644285074;

  // tf::Quaternion quat(target_pose.orientation.x, target_pose.orientation.y, target_pose.orientation.z, target_pose.orientation.w);

  // // 将四元数转换为对应的旋转矩阵
  // tf::Matrix3x3 rotation_matrix(quat);

  // // 使用旋转矩阵获取RPY角
  // double roll, pitch, yaw;
  // rotation_matrix.getRPY(roll, pitch, yaw);

  // // 输出RPY角的值
  // std::cout << "RPY angles (roll, pitch, yaw): (" << roll << ", " << pitch << ", " << yaw << ")" << std::endl;

    arm.setPoseTarget(target_pose);
    arm.move();//首先运动到圆心的位置
  //   sleep(1);


	// std::vector<geometry_msgs::Pose> waypoints;

  //   //将初始位姿加入路点列表
	// waypoints.push_back(target_pose);

  //   double centerA = target_pose.position.y;
  //   double centerB = target_pose.position.z;
  //   double radius = 0.013;

  //   for(double th=0.0; th<0.10; th=th+0.01)
  //   {
  //       target_pose.position.y = centerA + radius * cos(th);
  //       target_pose.position.z = centerB + radius * sin(th);
  //       target_pose.orientation.z = th;
  //       waypoints.push_back(target_pose);
  //   }

	// // 笛卡尔空间下的路径规划
	// moveit_msgs::RobotTrajectory trajectory;
	// const double jump_threshold = 0.0;
	// const double eef_step = 0.01;
	// double fraction = 0.0;
  //   int maxtries = 100;   //最大尝试规划次数
  //   int attempts = 0;     //已经尝试规划次数

  //   while(fraction < 1.0 && attempts < maxtries)
  //   {
  //       fraction = arm.computeCartesianPath(waypoints, eef_step, jump_threshold, trajectory);
  //       attempts++;
        
  //       if(attempts % 10 == 0)
  //           ROS_INFO("Still trying after %d attempts...", attempts);
  //   }
    
  //   if(fraction == 1)
  //   {   
  //       ROS_INFO("Path computed successfully. Moving the arm.");

	//     // 生成机械臂的运动规划数据
	//     moveit::planning_interface::MoveGroupInterface::Plan plan;
	//     plan.trajectory_ = trajectory;

	//     // 执行运动
	//     arm.execute(plan);
  //       sleep(1);
  //   }
  //   else
  //   {
  //       ROS_INFO("Path planning failed with only %0.6f success after %d attempts.", fraction, maxtries);
  //   }

  //   // 控制机械臂先回到初始化位置

	ros::shutdown(); 
	return 0;
}    
