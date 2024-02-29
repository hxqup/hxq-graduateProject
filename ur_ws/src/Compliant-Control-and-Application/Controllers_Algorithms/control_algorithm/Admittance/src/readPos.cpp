#include<ros/ros.h>
#include "cartesian_state_msgs/PoseTwist.h"
#include<iostream>
#include<fstream>

using namespace std;

ofstream outfile2;

void state_arm_callback(
  const cartesian_state_msgs::PoseTwistConstPtr msg) {
    outfile2<<msg->pose.position.x<<" "<<msg->pose.position.y<<" "<<msg->pose.position.z<<endl;
}

int main(int argc,char** argv) {
    outfile2.open("/home/hxq/pose.txt",ios::out | ios::trunc);
    ros::init(argc,argv,"pose_data");
    ros::NodeHandle nh;

   ros::Subscriber sub_arm_state_           = nh.subscribe("/cartesian_velocity_controller_sim/ee_state", 1000, 
      state_arm_callback);
    ros::AsyncSpinner spinner(2);
    spinner.start();
    ros::waitForShutdown();
    return 0;
}