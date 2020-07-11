
(cl:in-package :asdf)

(defsystem "lidar_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "GPSPacket" :depends-on ("_package_GPSPacket"))
    (:file "_package_GPSPacket" :depends-on ("_package"))
    (:file "ImuPacket" :depends-on ("_package_ImuPacket"))
    (:file "_package_ImuPacket" :depends-on ("_package"))
    (:file "LaserPacket" :depends-on ("_package_LaserPacket"))
    (:file "_package_LaserPacket" :depends-on ("_package"))
    (:file "RecvPacket" :depends-on ("_package_RecvPacket"))
    (:file "_package_RecvPacket" :depends-on ("_package"))
    (:file "SynchrPacket" :depends-on ("_package_SynchrPacket"))
    (:file "_package_SynchrPacket" :depends-on ("_package"))
  ))