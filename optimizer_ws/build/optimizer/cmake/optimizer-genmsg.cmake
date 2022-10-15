# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "optimizer: 11 messages, 0 services")

set(MSG_I_FLAGS "-Ioptimizer:/home/jacopo/optimizer_ws/src/optimizer/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Isensor_msgs:/opt/ros/noetic/share/sensor_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(optimizer_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/ThreeMap.msg" NAME_WE)
add_custom_target(_optimizer_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "optimizer" "/home/jacopo/optimizer_ws/src/optimizer/msg/ThreeMap.msg" "std_msgs/Header:sensor_msgs/Image"
)

get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/FloatArray.msg" NAME_WE)
add_custom_target(_optimizer_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "optimizer" "/home/jacopo/optimizer_ws/src/optimizer/msg/FloatArray.msg" "std_msgs/Header:geometry_msgs/Vector3"
)

get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/FloatList.msg" NAME_WE)
add_custom_target(_optimizer_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "optimizer" "/home/jacopo/optimizer_ws/src/optimizer/msg/FloatList.msg" "std_msgs/Header:sensor_msgs/CompressedImage"
)

get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/NNPreProcess.msg" NAME_WE)
add_custom_target(_optimizer_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "optimizer" "/home/jacopo/optimizer_ws/src/optimizer/msg/NNPreProcess.msg" "geometry_msgs/Vector3:std_msgs/Header:sensor_msgs/CompressedImage"
)

get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/keyframeMsg.msg" NAME_WE)
add_custom_target(_optimizer_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "optimizer" "/home/jacopo/optimizer_ws/src/optimizer/msg/keyframeMsg.msg" ""
)

get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/NNPreProcessLight.msg" NAME_WE)
add_custom_target(_optimizer_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "optimizer" "/home/jacopo/optimizer_ws/src/optimizer/msg/NNPreProcessLight.msg" "geometry_msgs/Vector3:std_msgs/Header:sensor_msgs/CompressedImage"
)

get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/ColoredImageMsg.msg" NAME_WE)
add_custom_target(_optimizer_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "optimizer" "/home/jacopo/optimizer_ws/src/optimizer/msg/ColoredImageMsg.msg" "geometry_msgs/Point:geometry_msgs/Quaternion:geometry_msgs/Pose:geometry_msgs/PoseStamped:sensor_msgs/Image:std_msgs/Header"
)

get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/NewMsg.msg" NAME_WE)
add_custom_target(_optimizer_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "optimizer" "/home/jacopo/optimizer_ws/src/optimizer/msg/NewMsg.msg" "geometry_msgs/Point:geometry_msgs/Quaternion:geometry_msgs/Pose:geometry_msgs/PoseStamped:sensor_msgs/Image:std_msgs/Header"
)

get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/BoolStampedMsg.msg" NAME_WE)
add_custom_target(_optimizer_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "optimizer" "/home/jacopo/optimizer_ws/src/optimizer/msg/BoolStampedMsg.msg" "std_msgs/Header"
)

get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/Idepth.msg" NAME_WE)
add_custom_target(_optimizer_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "optimizer" "/home/jacopo/optimizer_ws/src/optimizer/msg/Idepth.msg" "geometry_msgs/Point:geometry_msgs/Quaternion:geometry_msgs/Pose:geometry_msgs/PoseStamped:sensor_msgs/Image:std_msgs/Header"
)

get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/keyframeMsgModified.msg" NAME_WE)
add_custom_target(_optimizer_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "optimizer" "/home/jacopo/optimizer_ws/src/optimizer/msg/keyframeMsgModified.msg" "std_msgs/Header:sensor_msgs/Image"
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/ThreeMap.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/optimizer
)
_generate_msg_cpp(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/FloatArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/optimizer
)
_generate_msg_cpp(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/FloatList.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CompressedImage.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/optimizer
)
_generate_msg_cpp(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/NNPreProcess.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CompressedImage.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/optimizer
)
_generate_msg_cpp(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/keyframeMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/optimizer
)
_generate_msg_cpp(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/NNPreProcessLight.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CompressedImage.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/optimizer
)
_generate_msg_cpp(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/ColoredImageMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/optimizer
)
_generate_msg_cpp(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/NewMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/optimizer
)
_generate_msg_cpp(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/BoolStampedMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/optimizer
)
_generate_msg_cpp(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/Idepth.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/optimizer
)
_generate_msg_cpp(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/keyframeMsgModified.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/optimizer
)

### Generating Services

### Generating Module File
_generate_module_cpp(optimizer
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/optimizer
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(optimizer_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(optimizer_generate_messages optimizer_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/ThreeMap.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_cpp _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/FloatArray.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_cpp _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/FloatList.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_cpp _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/NNPreProcess.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_cpp _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/keyframeMsg.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_cpp _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/NNPreProcessLight.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_cpp _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/ColoredImageMsg.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_cpp _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/NewMsg.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_cpp _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/BoolStampedMsg.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_cpp _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/Idepth.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_cpp _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/keyframeMsgModified.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_cpp _optimizer_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(optimizer_gencpp)
add_dependencies(optimizer_gencpp optimizer_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS optimizer_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/ThreeMap.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/optimizer
)
_generate_msg_eus(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/FloatArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/optimizer
)
_generate_msg_eus(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/FloatList.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CompressedImage.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/optimizer
)
_generate_msg_eus(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/NNPreProcess.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CompressedImage.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/optimizer
)
_generate_msg_eus(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/keyframeMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/optimizer
)
_generate_msg_eus(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/NNPreProcessLight.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CompressedImage.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/optimizer
)
_generate_msg_eus(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/ColoredImageMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/optimizer
)
_generate_msg_eus(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/NewMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/optimizer
)
_generate_msg_eus(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/BoolStampedMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/optimizer
)
_generate_msg_eus(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/Idepth.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/optimizer
)
_generate_msg_eus(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/keyframeMsgModified.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/optimizer
)

### Generating Services

### Generating Module File
_generate_module_eus(optimizer
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/optimizer
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(optimizer_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(optimizer_generate_messages optimizer_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/ThreeMap.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_eus _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/FloatArray.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_eus _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/FloatList.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_eus _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/NNPreProcess.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_eus _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/keyframeMsg.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_eus _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/NNPreProcessLight.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_eus _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/ColoredImageMsg.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_eus _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/NewMsg.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_eus _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/BoolStampedMsg.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_eus _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/Idepth.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_eus _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/keyframeMsgModified.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_eus _optimizer_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(optimizer_geneus)
add_dependencies(optimizer_geneus optimizer_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS optimizer_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/ThreeMap.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/optimizer
)
_generate_msg_lisp(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/FloatArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/optimizer
)
_generate_msg_lisp(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/FloatList.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CompressedImage.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/optimizer
)
_generate_msg_lisp(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/NNPreProcess.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CompressedImage.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/optimizer
)
_generate_msg_lisp(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/keyframeMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/optimizer
)
_generate_msg_lisp(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/NNPreProcessLight.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CompressedImage.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/optimizer
)
_generate_msg_lisp(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/ColoredImageMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/optimizer
)
_generate_msg_lisp(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/NewMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/optimizer
)
_generate_msg_lisp(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/BoolStampedMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/optimizer
)
_generate_msg_lisp(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/Idepth.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/optimizer
)
_generate_msg_lisp(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/keyframeMsgModified.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/optimizer
)

### Generating Services

### Generating Module File
_generate_module_lisp(optimizer
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/optimizer
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(optimizer_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(optimizer_generate_messages optimizer_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/ThreeMap.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_lisp _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/FloatArray.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_lisp _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/FloatList.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_lisp _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/NNPreProcess.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_lisp _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/keyframeMsg.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_lisp _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/NNPreProcessLight.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_lisp _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/ColoredImageMsg.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_lisp _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/NewMsg.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_lisp _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/BoolStampedMsg.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_lisp _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/Idepth.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_lisp _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/keyframeMsgModified.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_lisp _optimizer_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(optimizer_genlisp)
add_dependencies(optimizer_genlisp optimizer_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS optimizer_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/ThreeMap.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/optimizer
)
_generate_msg_nodejs(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/FloatArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/optimizer
)
_generate_msg_nodejs(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/FloatList.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CompressedImage.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/optimizer
)
_generate_msg_nodejs(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/NNPreProcess.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CompressedImage.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/optimizer
)
_generate_msg_nodejs(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/keyframeMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/optimizer
)
_generate_msg_nodejs(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/NNPreProcessLight.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CompressedImage.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/optimizer
)
_generate_msg_nodejs(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/ColoredImageMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/optimizer
)
_generate_msg_nodejs(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/NewMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/optimizer
)
_generate_msg_nodejs(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/BoolStampedMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/optimizer
)
_generate_msg_nodejs(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/Idepth.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/optimizer
)
_generate_msg_nodejs(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/keyframeMsgModified.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/optimizer
)

### Generating Services

### Generating Module File
_generate_module_nodejs(optimizer
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/optimizer
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(optimizer_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(optimizer_generate_messages optimizer_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/ThreeMap.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_nodejs _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/FloatArray.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_nodejs _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/FloatList.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_nodejs _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/NNPreProcess.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_nodejs _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/keyframeMsg.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_nodejs _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/NNPreProcessLight.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_nodejs _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/ColoredImageMsg.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_nodejs _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/NewMsg.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_nodejs _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/BoolStampedMsg.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_nodejs _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/Idepth.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_nodejs _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/keyframeMsgModified.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_nodejs _optimizer_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(optimizer_gennodejs)
add_dependencies(optimizer_gennodejs optimizer_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS optimizer_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/ThreeMap.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/optimizer
)
_generate_msg_py(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/FloatArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/optimizer
)
_generate_msg_py(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/FloatList.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CompressedImage.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/optimizer
)
_generate_msg_py(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/NNPreProcess.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CompressedImage.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/optimizer
)
_generate_msg_py(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/keyframeMsg.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/optimizer
)
_generate_msg_py(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/NNPreProcessLight.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Vector3.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/CompressedImage.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/optimizer
)
_generate_msg_py(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/ColoredImageMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/optimizer
)
_generate_msg_py(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/NewMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/optimizer
)
_generate_msg_py(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/BoolStampedMsg.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/optimizer
)
_generate_msg_py(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/Idepth.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/optimizer
)
_generate_msg_py(optimizer
  "/home/jacopo/optimizer_ws/src/optimizer/msg/keyframeMsgModified.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/sensor_msgs/cmake/../msg/Image.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/optimizer
)

### Generating Services

### Generating Module File
_generate_module_py(optimizer
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/optimizer
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(optimizer_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(optimizer_generate_messages optimizer_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/ThreeMap.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_py _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/FloatArray.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_py _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/FloatList.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_py _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/NNPreProcess.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_py _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/keyframeMsg.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_py _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/NNPreProcessLight.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_py _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/ColoredImageMsg.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_py _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/NewMsg.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_py _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/BoolStampedMsg.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_py _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/Idepth.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_py _optimizer_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jacopo/optimizer_ws/src/optimizer/msg/keyframeMsgModified.msg" NAME_WE)
add_dependencies(optimizer_generate_messages_py _optimizer_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(optimizer_genpy)
add_dependencies(optimizer_genpy optimizer_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS optimizer_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/optimizer)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/optimizer
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(optimizer_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(optimizer_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET sensor_msgs_generate_messages_cpp)
  add_dependencies(optimizer_generate_messages_cpp sensor_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/optimizer)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/optimizer
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(optimizer_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(optimizer_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET sensor_msgs_generate_messages_eus)
  add_dependencies(optimizer_generate_messages_eus sensor_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/optimizer)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/optimizer
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(optimizer_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(optimizer_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET sensor_msgs_generate_messages_lisp)
  add_dependencies(optimizer_generate_messages_lisp sensor_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/optimizer)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/optimizer
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(optimizer_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(optimizer_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET sensor_msgs_generate_messages_nodejs)
  add_dependencies(optimizer_generate_messages_nodejs sensor_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/optimizer)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/optimizer\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/optimizer
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(optimizer_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(optimizer_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET sensor_msgs_generate_messages_py)
  add_dependencies(optimizer_generate_messages_py sensor_msgs_generate_messages_py)
endif()
