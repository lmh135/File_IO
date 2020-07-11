; Auto-generated. Do not edit!


(cl:in-package lidar_msgs-msg)


;//! \htmlinclude SynchrPacket.msg.html

(cl:defclass <SynchrPacket> (roslisp-msg-protocol:ros-message)
  ((laserpkt
    :reader laserpkt
    :initarg :laserpkt
    :type lidar_msgs-msg:LaserPacket
    :initform (cl:make-instance 'lidar_msgs-msg:LaserPacket))
   (imupkt
    :reader imupkt
    :initarg :imupkt
    :type (cl:vector lidar_msgs-msg:ImuPacket)
   :initform (cl:make-array 12 :element-type 'lidar_msgs-msg:ImuPacket :initial-element (cl:make-instance 'lidar_msgs-msg:ImuPacket)))
   (gpspkt
    :reader gpspkt
    :initarg :gpspkt
    :type lidar_msgs-msg:GPSPacket
    :initform (cl:make-instance 'lidar_msgs-msg:GPSPacket)))
)

(cl:defclass SynchrPacket (<SynchrPacket>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SynchrPacket>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SynchrPacket)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lidar_msgs-msg:<SynchrPacket> is deprecated: use lidar_msgs-msg:SynchrPacket instead.")))

(cl:ensure-generic-function 'laserpkt-val :lambda-list '(m))
(cl:defmethod laserpkt-val ((m <SynchrPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lidar_msgs-msg:laserpkt-val is deprecated.  Use lidar_msgs-msg:laserpkt instead.")
  (laserpkt m))

(cl:ensure-generic-function 'imupkt-val :lambda-list '(m))
(cl:defmethod imupkt-val ((m <SynchrPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lidar_msgs-msg:imupkt-val is deprecated.  Use lidar_msgs-msg:imupkt instead.")
  (imupkt m))

(cl:ensure-generic-function 'gpspkt-val :lambda-list '(m))
(cl:defmethod gpspkt-val ((m <SynchrPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lidar_msgs-msg:gpspkt-val is deprecated.  Use lidar_msgs-msg:gpspkt instead.")
  (gpspkt m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SynchrPacket>) ostream)
  "Serializes a message object of type '<SynchrPacket>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'laserpkt) ostream)
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'imupkt))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'gpspkt) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SynchrPacket>) istream)
  "Deserializes a message object of type '<SynchrPacket>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'laserpkt) istream)
  (cl:setf (cl:slot-value msg 'imupkt) (cl:make-array 12))
  (cl:let ((vals (cl:slot-value msg 'imupkt)))
    (cl:dotimes (i 12)
    (cl:setf (cl:aref vals i) (cl:make-instance 'lidar_msgs-msg:ImuPacket))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream)))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'gpspkt) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SynchrPacket>)))
  "Returns string type for a message object of type '<SynchrPacket>"
  "lidar_msgs/SynchrPacket")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SynchrPacket)))
  "Returns string type for a message object of type 'SynchrPacket"
  "lidar_msgs/SynchrPacket")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SynchrPacket>)))
  "Returns md5sum for a message object of type '<SynchrPacket>"
  "78587254adf0ff3522b94defe9027af8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SynchrPacket)))
  "Returns md5sum for a message object of type 'SynchrPacket"
  "78587254adf0ff3522b94defe9027af8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SynchrPacket>)))
  "Returns full string definition for message of type '<SynchrPacket>"
  (cl:format cl:nil "LaserPacket laserpkt~%ImuPacket[12] imupkt~%GPSPacket gpspkt~%~%================================================================================~%MSG: lidar_msgs/LaserPacket~%float32[12] Azimuth~%float32[192] distance~%uint64 timestamp~%uint64 id_num~%~%================================================================================~%MSG: lidar_msgs/ImuPacket~%float32[3] imu_gyro~%float32[3] imu_accel~%float32[3] imu_magn~%float32[3] imu_euler~%uint64 timestamp~%uint64 id_num~%~%================================================================================~%MSG: lidar_msgs/GPSPacket~%float64[3] ned_xyz~%float64[3] ned_uvw~%float64 heading~%uint8 gps_sats~%uint8 gps_mod~%uint64 timestamp~%uint64 id_num~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SynchrPacket)))
  "Returns full string definition for message of type 'SynchrPacket"
  (cl:format cl:nil "LaserPacket laserpkt~%ImuPacket[12] imupkt~%GPSPacket gpspkt~%~%================================================================================~%MSG: lidar_msgs/LaserPacket~%float32[12] Azimuth~%float32[192] distance~%uint64 timestamp~%uint64 id_num~%~%================================================================================~%MSG: lidar_msgs/ImuPacket~%float32[3] imu_gyro~%float32[3] imu_accel~%float32[3] imu_magn~%float32[3] imu_euler~%uint64 timestamp~%uint64 id_num~%~%================================================================================~%MSG: lidar_msgs/GPSPacket~%float64[3] ned_xyz~%float64[3] ned_uvw~%float64 heading~%uint8 gps_sats~%uint8 gps_mod~%uint64 timestamp~%uint64 id_num~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SynchrPacket>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'laserpkt))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'imupkt) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'gpspkt))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SynchrPacket>))
  "Converts a ROS message object to a list"
  (cl:list 'SynchrPacket
    (cl:cons ':laserpkt (laserpkt msg))
    (cl:cons ':imupkt (imupkt msg))
    (cl:cons ':gpspkt (gpspkt msg))
))
