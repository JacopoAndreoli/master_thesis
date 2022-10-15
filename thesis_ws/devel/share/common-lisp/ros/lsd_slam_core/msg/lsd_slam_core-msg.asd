
(cl:in-package :asdf)

(defsystem "lsd_slam_core-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :sensor_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "ColoredImageMsg" :depends-on ("_package_ColoredImageMsg"))
    (:file "_package_ColoredImageMsg" :depends-on ("_package"))
    (:file "Idepth" :depends-on ("_package_Idepth"))
    (:file "_package_Idepth" :depends-on ("_package"))
    (:file "NewMsg" :depends-on ("_package_NewMsg"))
    (:file "_package_NewMsg" :depends-on ("_package"))
    (:file "ThreeMap" :depends-on ("_package_ThreeMap"))
    (:file "_package_ThreeMap" :depends-on ("_package"))
  ))