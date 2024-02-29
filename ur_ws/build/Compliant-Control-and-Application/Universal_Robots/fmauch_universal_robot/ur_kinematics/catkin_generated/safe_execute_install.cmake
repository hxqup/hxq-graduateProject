execute_process(COMMAND "/home/hxq/ur_ws/build/Compliant-Control-and-Application/Universal_Robots/fmauch_universal_robot/ur_kinematics/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/hxq/ur_ws/build/Compliant-Control-and-Application/Universal_Robots/fmauch_universal_robot/ur_kinematics/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
