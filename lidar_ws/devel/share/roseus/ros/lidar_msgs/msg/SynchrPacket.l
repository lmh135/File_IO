;; Auto-generated. Do not edit!


(when (boundp 'lidar_msgs::SynchrPacket)
  (if (not (find-package "LIDAR_MSGS"))
    (make-package "LIDAR_MSGS"))
  (shadow 'SynchrPacket (find-package "LIDAR_MSGS")))
(unless (find-package "LIDAR_MSGS::SYNCHRPACKET")
  (make-package "LIDAR_MSGS::SYNCHRPACKET"))

(in-package "ROS")
;;//! \htmlinclude SynchrPacket.msg.html


(defclass lidar_msgs::SynchrPacket
  :super ros::object
  :slots (_laserpkt _imupkt _gpspkt ))

(defmethod lidar_msgs::SynchrPacket
  (:init
   (&key
    ((:laserpkt __laserpkt) (instance lidar_msgs::LaserPacket :init))
    ((:imupkt __imupkt) (let (r) (dotimes (i 12) (push (instance lidar_msgs::ImuPacket :init) r)) r))
    ((:gpspkt __gpspkt) (instance lidar_msgs::GPSPacket :init))
    )
   (send-super :init)
   (setq _laserpkt __laserpkt)
   (setq _imupkt __imupkt)
   (setq _gpspkt __gpspkt)
   self)
  (:laserpkt
   (&rest __laserpkt)
   (if (keywordp (car __laserpkt))
       (send* _laserpkt __laserpkt)
     (progn
       (if __laserpkt (setq _laserpkt (car __laserpkt)))
       _laserpkt)))
  (:imupkt
   (&rest __imupkt)
   (if (keywordp (car __imupkt))
       (send* _imupkt __imupkt)
     (progn
       (if __imupkt (setq _imupkt (car __imupkt)))
       _imupkt)))
  (:gpspkt
   (&rest __gpspkt)
   (if (keywordp (car __gpspkt))
       (send* _gpspkt __gpspkt)
     (progn
       (if __gpspkt (setq _gpspkt (car __gpspkt)))
       _gpspkt)))
  (:serialization-length
   ()
   (+
    ;; lidar_msgs/LaserPacket _laserpkt
    (send _laserpkt :serialization-length)
    ;; lidar_msgs/ImuPacket[12] _imupkt
    (apply #'+ (send-all _imupkt :serialization-length))
    ;; lidar_msgs/GPSPacket _gpspkt
    (send _gpspkt :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; lidar_msgs/LaserPacket _laserpkt
       (send _laserpkt :serialize s)
     ;; lidar_msgs/ImuPacket[12] _imupkt
     (dolist (elem _imupkt)
       (send elem :serialize s)
       )
     ;; lidar_msgs/GPSPacket _gpspkt
       (send _gpspkt :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; lidar_msgs/LaserPacket _laserpkt
     (send _laserpkt :deserialize buf ptr-) (incf ptr- (send _laserpkt :serialization-length))
   ;; lidar_msgs/ImuPacket[12] _imupkt
   (dotimes (i 12)
     (send (elt _imupkt i) :deserialize buf ptr-) (incf ptr- (send (elt _imupkt i) :serialization-length))
     )
   ;; lidar_msgs/GPSPacket _gpspkt
     (send _gpspkt :deserialize buf ptr-) (incf ptr- (send _gpspkt :serialization-length))
   ;;
   self)
  )

(setf (get lidar_msgs::SynchrPacket :md5sum-) "78587254adf0ff3522b94defe9027af8")
(setf (get lidar_msgs::SynchrPacket :datatype-) "lidar_msgs/SynchrPacket")
(setf (get lidar_msgs::SynchrPacket :definition-)
      "LaserPacket laserpkt
ImuPacket[12] imupkt
GPSPacket gpspkt

================================================================================
MSG: lidar_msgs/LaserPacket
float32[12] Azimuth
float32[192] distance
uint64 timestamp
uint64 id_num

================================================================================
MSG: lidar_msgs/ImuPacket
float32[3] imu_gyro
float32[3] imu_accel
float32[3] imu_magn
float32[3] imu_euler
uint64 timestamp
uint64 id_num

================================================================================
MSG: lidar_msgs/GPSPacket
float64[3] ned_xyz
float64[3] ned_uvw
float64 heading
uint8 gps_sats
uint8 gps_mod
uint64 timestamp
uint64 id_num

")



(provide :lidar_msgs/SynchrPacket "78587254adf0ff3522b94defe9027af8")


