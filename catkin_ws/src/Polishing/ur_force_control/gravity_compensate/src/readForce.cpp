#include<ros/ros.h>
#include<geometry_msgs/WrenchStamped.h>
#include<iostream>
#include<fstream>

using namespace std;

ofstream outfile1,outfile2;

void WrenchsubCallback(const geometry_msgs::WrenchStamped& msg) {
    outfile1<<msg.wrench.force.x<<" "<<msg.wrench.force.y<<" "<<msg.wrench.force.z<<" "<<msg.wrench.torque.x<<" "<<msg.wrench.torque.y<<" "<<msg.wrench.torque.z<<endl;
}

void WrenchsubCallback1(const geometry_msgs::WrenchStamped& msg) {
    outfile2<<msg.wrench.force.x<<" "<<msg.wrench.force.y<<" "<<msg.wrench.force.z<<" "<<msg.wrench.torque.x<<" "<<msg.wrench.torque.y<<" "<<msg.wrench.torque.z<<endl;
}

int main(int argc,char** argv) {
    outfile1.open("/home/hxq/basedata.txt",ios::out | ios::trunc);
    outfile2.open("/home/hxq/tooldata.txt",ios::out | ios::trunc);
    ros::init(argc,argv,"force_data");
    ros::NodeHandle nh;

    ros::Subscriber wrench_sub = nh.subscribe("/compensate_wrench_base",1000,WrenchsubCallback);
    ros::Subscriber wrench_sub1 = nh.subscribe("/compensate_wrench_tool",1000,WrenchsubCallback1);
    ros::AsyncSpinner spinner(2);
    spinner.start();
    ros::waitForShutdown();
    return 0;
}