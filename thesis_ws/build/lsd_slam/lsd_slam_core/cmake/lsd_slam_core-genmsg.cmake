# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "lsd_slam_core: 4 messages, 0 services")

set(MSG_I_FLAGS "-Ilsd_slam_core:/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(lsd_slam_core_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/ThreeMap.msg" NAME_WE)
add_custom_target(_lsd_slam_core_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "lsd_slam_core" "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/ThreeMap.msg" "sensor_msgs/Image:std_msgs/Header"
)

get_filename_component(_filename "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/ColoredImageMsg.msg" NAME_WE)
add_custom_target(_lsd_slam_core_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "lsd_slam_core" "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/ColoredImageMsg.msg" "sensor_msgs/Image:geometry_msgs/Pose:std_msgs/Header:geometry_msgs/Quaternion:geometry_msgs/PoseStamped:geometry_msgs/Point"
)

get_filename_component(_filename "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/NewMsg.msg" NAME_WE)
add_custom_target(_lsd_slam_core_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "lsd_slam_core" "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/NewMsg.msg" "sensor_msgs/Image:geometry_msgs/Pose:std_msgs/Header:geometry_msgs/Quaternion:geometry_msgs/PoseStamped:geometry_msgs/Point"
)

get_filename_component(_filename "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/Idepth.msg" NAME_WE)
add_custom_target(_lsd_slam_core_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "lsd_slam_core" "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/Idepth.msg" "sensor_msgs/Image:geometry_msgs/Pose:std_msgs/Header:geometry_msgs/Quaternion:geometry_msgs/PoseStamped:geometry_msgs/Point"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(lsd_slam_core
  "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/ThreeMap.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lsd_slam_core
)
_generate_msg_cpp(lsd_slam_core
  "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/ColoredImageMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lsd_slam_core
)
_generate_msg_cpp(lsd_slam_core
  "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/NewMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lsd_slam_core
)
_generate_msg_cpp(lsd_slam_core
  "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/Idepth.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lsd_slam_core
)

### Generating Services

### Generating Module File
_generate_module_cpp(lsd_slam_core
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lsd_slam_core
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(lsd_slam_core_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(lsd_slam_core_generate_messages lsd_slam_core_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/ThreeMap.msg" NAME_WE)
add_dependencies(lsd_slam_core_generate_messages_cpp _lsd_slam_core_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/ColoredImageMsg.msg" NAME_WE)
add_dependencies(lsd_slam_core_generate_messages_cpp _lsd_slam_core_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/NewMsg.msg" NAME_WE)
add_dependencies(lsd_slam_core_generate_messages_cpp _lsd_slam_core_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/Idepth.msg" NAME_WE)
add_dependencies(lsd_slam_core_generate_messages_cpp _lsd_slam_core_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lsd_slam_core_gencpp)
add_dependencies(lsd_slam_core_gencpp lsd_slam_core_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lsd_slam_core_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(lsd_slam_core
  "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/ThreeMap.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lsd_slam_core
)
_generate_msg_eus(lsd_slam_core
  "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/ColoredImageMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lsd_slam_core
)
_generate_msg_eus(lsd_slam_core
  "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/NewMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lsd_slam_core
)
_generate_msg_eus(lsd_slam_core
  "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/Idepth.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lsd_slam_core
)

### Generating Services

### Generating Module File
_generate_module_eus(lsd_slam_core
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lsd_slam_core
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(lsd_slam_core_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(lsd_slam_core_generate_messages lsd_slam_core_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/ThreeMap.msg" NAME_WE)
add_dependencies(lsd_slam_core_generate_messages_eus _lsd_slam_core_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/ColoredImageMsg.msg" NAME_WE)
add_dependencies(lsd_slam_core_generate_messages_eus _lsd_slam_core_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/NewMsg.msg" NAME_WE)
add_dependencies(lsd_slam_core_generate_messages_eus _lsd_slam_core_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/Idepth.msg" NAME_WE)
add_dependencies(lsd_slam_core_generate_messages_eus _lsd_slam_core_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lsd_slam_core_geneus)
add_dependencies(lsd_slam_core_geneus lsd_slam_core_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lsd_slam_core_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(lsd_slam_core
  "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/ThreeMap.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lsd_slam_core
)
_generate_msg_lisp(lsd_slam_core
  "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/ColoredImageMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lsd_slam_core
)
_generate_msg_lisp(lsd_slam_core
  "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/NewMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lsd_slam_core
)
_generate_msg_lisp(lsd_slam_core
  "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/Idepth.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lsd_slam_core
)

### Generating Services

### Generating Module File
_generate_module_lisp(lsd_slam_core
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lsd_slam_core
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(lsd_slam_core_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(lsd_slam_core_generate_messages lsd_slam_core_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/ThreeMap.msg" NAME_WE)
add_dependencies(lsd_slam_core_generate_messages_lisp _lsd_slam_core_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/ColoredImageMsg.msg" NAME_WE)
add_dependencies(lsd_slam_core_generate_messages_lisp _lsd_slam_core_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/NewMsg.msg" NAME_WE)
add_dependencies(lsd_slam_core_generate_messages_lisp _lsd_slam_core_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/Idepth.msg" NAME_WE)
add_dependencies(lsd_slam_core_generate_messages_lisp _lsd_slam_core_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lsd_slam_core_genlisp)
add_dependencies(lsd_slam_core_genlisp lsd_slam_core_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lsd_slam_core_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(lsd_slam_core
  "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/ThreeMap.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lsd_slam_core
)
_generate_msg_nodejs(lsd_slam_core
  "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/ColoredImageMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lsd_slam_core
)
_generate_msg_nodejs(lsd_slam_core
  "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/NewMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lsd_slam_core
)
_generate_msg_nodejs(lsd_slam_core
  "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/Idepth.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lsd_slam_core
)

### Generating Services

### Generating Module File
_generate_module_nodejs(lsd_slam_core
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lsd_slam_core
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(lsd_slam_core_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(lsd_slam_core_generate_messages lsd_slam_core_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/ThreeMap.msg" NAME_WE)
add_dependencies(lsd_slam_core_generate_messages_nodejs _lsd_slam_core_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/ColoredImageMsg.msg" NAME_WE)
add_dependencies(lsd_slam_core_generate_messages_nodejs _lsd_slam_core_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/NewMsg.msg" NAME_WE)
add_dependencies(lsd_slam_core_generate_messages_nodejs _lsd_slam_core_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/Idepth.msg" NAME_WE)
add_dependencies(lsd_slam_core_generate_messages_nodejs _lsd_slam_core_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lsd_slam_core_gennodejs)
add_dependencies(lsd_slam_core_gennodejs lsd_slam_core_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lsd_slam_core_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(lsd_slam_core
  "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/ThreeMap.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lsd_slam_core
)
_generate_msg_py(lsd_slam_core
  "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/ColoredImageMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lsd_slam_core
)
_generate_msg_py(lsd_slam_core
  "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/NewMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lsd_slam_core
)
_generate_msg_py(lsd_slam_core
  "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/Idepth.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lsd_slam_core
)

### Generating Services

### Generating Module File
_generate_module_py(lsd_slam_core
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lsd_slam_core
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(lsd_slam_core_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(lsd_slam_core_generate_messages lsd_slam_core_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/ThreeMap.msg" NAME_WE)
add_dependencies(lsd_slam_core_generate_messages_py _lsd_slam_core_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/ColoredImageMsg.msg" NAME_WE)
add_dependencies(lsd_slam_core_generate_messages_py _lsd_slam_core_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/NewMsg.msg" NAME_WE)
add_dependencies(lsd_slam_core_generate_messages_py _lsd_slam_core_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/thesis_ws/src/lsd_slam/lsd_slam_core/msg/Idepth.msg" NAME_WE)
add_dependencies(lsd_slam_core_generate_messages_py _lsd_slam_core_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(lsd_slam_core_genpy)
add_dependencies(lsd_slam_core_genpy lsd_slam_core_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS lsd_slam_core_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lsd_slam_core)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/lsd_slam_core
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(lsd_slam_core_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(lsd_slam_core_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(lsd_slam_core_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lsd_slam_core)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/lsd_slam_core
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(lsd_slam_core_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(lsd_slam_core_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(lsd_slam_core_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lsd_slam_core)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/lsd_slam_core
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(lsd_slam_core_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(lsd_slam_core_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(lsd_slam_core_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lsd_slam_core)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/lsd_slam_core
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(lsd_slam_core_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(lsd_slam_core_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(lsd_slam_core_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lsd_slam_core)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lsd_slam_core\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/lsd_slam_core
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(lsd_slam_core_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(lsd_slam_core_generate_messages_py sensor_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(lsd_slam_core_generate_messages_py geometry_msgs_generate_messages_py)
endif()
