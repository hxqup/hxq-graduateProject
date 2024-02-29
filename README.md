# 操作指南

## 运行环境 
**ubuntu18.04 + ROS melodic**

## 操作流程概述
1. roscore
2. sudo chmod a+rw /dev/ttyUSB0
2. 进入catkin_ws进行重力补偿
rosrun robitiq_ft_sensor rq_sensor
然后进行重力补偿
先连接机械臂
roslaunch ur_robot_driver ur5e_bringup.launch limited:=true robot_ip:=192.168.1.100 kinematics_config:="/home/hxq/catkin_ws/src/Polishing/fmauch_universal_robot/ur_description/config
/my_robot_calibration.yaml"
然后rosrun gravity_compensate文件夹里面的两个文件，一个是控制机械臂运动，采集各个位姿下的力然后估算重力，另外一个文件用于实时的进行重力补偿
其中先运行：rosrun gravity_compensate gravity_identify
再运行：rosrun gravity_compensate gravity_compensate

3. 进入ur_ws进行阻抗控制
把之前那个ur5e_bringup.launch取消，然后重新在这个文件夹下source，后运行：
roslaunch ur_robot_driver ur5e_bringup.launch limited:=true robot_ip:=192.168.1.100 kinematics_config:="/home/hxq/catkin_ws/src/Polishing/fmauch_universal_robot/ur_description/config
/my_robot_calibration.yaml"
之后再运行
roslaunch Admittance Admittance.launch
即可机械臂恒力运动，恒力大小和机械臂运动速度大小在Admittance.cpp里面修改
