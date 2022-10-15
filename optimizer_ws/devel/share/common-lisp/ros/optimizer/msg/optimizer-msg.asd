
(cl:in-package :asdf)

(defsystem "optimizer-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :sensor_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "BoolStampedMsg" :depends-on ("_package_BoolStampedMsg"))
    (:file "_package_BoolStampedMsg" :depends-on ("_package"))
    (:file "ColoredImageMsg" :depends-on ("_package_ColoredImageMsg"))
    (:file "_package_ColoredImageMsg" :depends-on ("_package"))
    (:file "FloatArray" :depends-on ("_package_FloatArray"))
    (:file "_package_FloatArray" :depends-on ("_package"))
    (:file "FloatList" :depends-on ("_package_FloatList"))
    (:file "_package_FloatList" :depends-on ("_package"))
    (:file "Idepth" :depends-on ("_package_Idepth"))
    (:file "_package_Idepth" :depends-on ("_package"))
    (:file "NNPreProcess" :depends-on ("_package_NNPreProcess"))
    (:file "_package_NNPreProcess" :depends-on ("_package"))
    (:file "NNPreProcessLight" :depends-on ("_package_NNPreProcessLight"))
    (:file "_package_NNPreProcessLight" :depends-on ("_package"))
    (:file "NewMsg" :depends-on ("_package_NewMsg"))
    (:file "_package_NewMsg" :depends-on ("_package"))
    (:file "ThreeMap" :depends-on ("_package_ThreeMap"))
    (:file "_package_ThreeMap" :depends-on ("_package"))
    (:file "keyframeMsg" :depends-on ("_package_keyframeMsg"))
    (:file "_package_keyframeMsg" :depends-on ("_package"))
    (:file "keyframeMsgModified" :depends-on ("_package_keyframeMsgModified"))
    (:file "_package_keyframeMsgModified" :depends-on ("_package"))
  ))