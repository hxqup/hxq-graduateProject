# generated from catkin/cmake/template/pkg.context.pc.in
CATKIN_PACKAGE_PREFIX = ""
PROJECT_PKG_CONFIG_INCLUDE_DIRS = "${prefix}/include".split(';') if "${prefix}/include" != "" else []
PROJECT_CATKIN_DEPENDS = "joint_effort_msg;joint_state_msg;std_msgs".replace(';', ' ')
PKG_CONFIG_LIBRARIES_WITH_PREFIX = "-ljoint_torque_controller".split(';') if "-ljoint_torque_controller" != "" else []
PROJECT_NAME = "joint_torque_controller"
PROJECT_SPACE_DIR = "/home/hxq/catkin_ws/install"
PROJECT_VERSION = "0.0.0"
