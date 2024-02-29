#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/hxq/catkin_ws/src/robotiq/robotiq_3f_gripper_control"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/hxq/catkin_ws/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/hxq/catkin_ws/install/lib/python2.7/dist-packages:/home/hxq/catkin_ws/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/hxq/catkin_ws/build" \
    "/usr/bin/python2" \
    "/home/hxq/catkin_ws/src/robotiq/robotiq_3f_gripper_control/setup.py" \
     \
    build --build-base "/home/hxq/catkin_ws/build/robotiq/robotiq_3f_gripper_control" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/hxq/catkin_ws/install" --install-scripts="/home/hxq/catkin_ws/install/bin"
