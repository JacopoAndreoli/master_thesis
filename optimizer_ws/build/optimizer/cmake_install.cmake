# Install script for directory: /home/jacopo/optimizer_ws/src/optimizer

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/jacopo/optimizer_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/optimizer/msg" TYPE FILE FILES
    "/home/jacopo/optimizer_ws/src/optimizer/msg/ThreeMap.msg"
    "/home/jacopo/optimizer_ws/src/optimizer/msg/FloatArray.msg"
    "/home/jacopo/optimizer_ws/src/optimizer/msg/FloatList.msg"
    "/home/jacopo/optimizer_ws/src/optimizer/msg/NNPreProcess.msg"
    "/home/jacopo/optimizer_ws/src/optimizer/msg/keyframeMsg.msg"
    "/home/jacopo/optimizer_ws/src/optimizer/msg/NNPreProcessLight.msg"
    "/home/jacopo/optimizer_ws/src/optimizer/msg/ColoredImageMsg.msg"
    "/home/jacopo/optimizer_ws/src/optimizer/msg/NewMsg.msg"
    "/home/jacopo/optimizer_ws/src/optimizer/msg/BoolStampedMsg.msg"
    "/home/jacopo/optimizer_ws/src/optimizer/msg/Idepth.msg"
    "/home/jacopo/optimizer_ws/src/optimizer/msg/keyframeMsgModified.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/optimizer/cmake" TYPE FILE FILES "/home/jacopo/optimizer_ws/build/optimizer/catkin_generated/installspace/optimizer-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/jacopo/optimizer_ws/devel/include/optimizer")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/jacopo/optimizer_ws/devel/share/roseus/ros/optimizer")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/jacopo/optimizer_ws/devel/share/common-lisp/ros/optimizer")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/jacopo/optimizer_ws/devel/share/gennodejs/ros/optimizer")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python3" -m compileall "/home/jacopo/optimizer_ws/devel/lib/python3/dist-packages/optimizer")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python3/dist-packages" TYPE DIRECTORY FILES "/home/jacopo/optimizer_ws/devel/lib/python3/dist-packages/optimizer")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/jacopo/optimizer_ws/build/optimizer/catkin_generated/installspace/optimizer.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/optimizer/cmake" TYPE FILE FILES "/home/jacopo/optimizer_ws/build/optimizer/catkin_generated/installspace/optimizer-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/optimizer/cmake" TYPE FILE FILES
    "/home/jacopo/optimizer_ws/build/optimizer/catkin_generated/installspace/optimizerConfig.cmake"
    "/home/jacopo/optimizer_ws/build/optimizer/catkin_generated/installspace/optimizerConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/optimizer" TYPE FILE FILES "/home/jacopo/optimizer_ws/src/optimizer/package.xml")
endif()

