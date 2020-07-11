; Auto-generated. Do not edit!


(cl:in-package lidar_msgs-msg)


;//! \htmlinclude RecvPacket.msg.html

(cl:defclass <RecvPacket> (roslisp-msg-protocol:ros-message)
  ((laserpkt
    :reader laserpkt
    :initarg :laserpkt
    :type lidar_msgs-msg:LaserPacket
    :initform (cl:make-instance 'lidar_msgs-msg:LaserPacket))
   (imupkt
    :reader imupkt
    :initarg :imupkt
    :type lidar_msgs-msg:ImuPacket
    :initform (cl:make-instance 'lidar_msgs-msg:ImuPacket))
   (gpspkt
    :reader gpspkt
    :initarg :gpspkt
    :type lidar_msgs-msg:GPSPacket
    :initform (cl:make-instance 'lidar_msgs-msg:GPSPacket)))
)

(cl:defclass RecvPacket (<RecvPacket>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RecvPacket>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RecvPacket)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lidar_msgs-msg:<RecvPacket> is deprecated: use lidar_msgs-msg:RecvPacket instead.")))

(cl:ensure-generic-function 'laserpkt-val :lambda-list '(m))
(cl:defmethod laserpkt-val ((m <RecvPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lidar_msgs-msg:laserpkt-val is deprecated.  Use lidar_msgs-msg:laserpkt instead.")
  (laserpkt m))

(cl:ensure-generic-function 'imupkt-val :lambda-list '(m))
(cl:defmethod imupkt-val ((m <RecvPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lidar_msgs-msg:imupkt-val is deprecated.  Use lidar_msgs-msg:imupkt instead.")
  (imupkt m))

(cl:ensure-generic-function 'gpspkt-val :lambda-list '(m))
(cl:defmethod gpspkt-val ((m <RecvPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lidar_msgs-msg:gpspkt-val is deprecated.  Use lidar_msgs-msg:gpspkt instead.")
  (gpspkt m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RecvPacket>) ostream)
  "Serializes a message object of type '<RecvPacket>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'laserpkt) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'imupkt) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'gpspkt) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RecvPacket>) istream)
  "Deserializes a message object of type '<RecvPacket>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'laserpkt) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'imupkt) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'gpspkt) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RecvPacket>)))
  "Returns string type for a message object of type '<RecvPacket>"
  "lidar_msgs/RecvPacket")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RecvPacket)))
  "Returns string type for a message object of type 'RecvPacket"
  "lidar_msgs/RecvPacket")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RecvPacket>)))
  "Returns md5sum for a message object of type '<RecvPacket>"
  "78587254adf0ff3522b94defe9027af8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RecvPacket)))
  "Returns md5sum for a message object of type 'RecvPacket"
  "78587254adf0ff3522b94defe9027af8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RecvPacket>)))
  "Returns full string definition for message of type '<RecvPacket>"
  (cl:format cl:nil "LaserPacket laserpkt~%ImuPacket imupkt~%GPSPacket gpspkt~%~%================================================================================~%MSG: lidar_msgs/LaserPacket~%float32[12] Azimuth~%float32[192] distance~%uint64 timestamp~%uint64 id_num~%~%================================================================================~%MSG: lidar_msgs/ImuPacket~%float32[3] imu_gyro~%float32[3] imu_accel~%float32[3] imu_magn~%float32[3] imu_euler~%uint64 timestamp~%uint64 id_num~%~%================================================================================~%MSG: lidar_msgs/GPSPacket~%float64[3] ned_xyz~%float64[3] ned_uvw~%float64 heading~%uint8 gps_sats~%uint8 gps_mod~%uint64 timestamp~%uint64 id_num~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RecvPacket)))
  "Returns full string definition for message of type 'RecvPacket"
  (cl:format cl:nil "LaserPacket laserpkt~%ImuPacket imupkt~%GPSPacket gpspkt~%~%================================================================================~%MSG: lidar_msgs/LaserPacket~%float32[12] Azimuth~%float32[192] distance~%uint64 timestamp~%uint64 id_num~%~%================================================================================~%MSG: lidar_msgs/ImuPacket~%float32[3] imu_gyro~%float32[3] imu_accel~%float32[3] imu_magn~%float32[3] imu_euler~%uint64 timestamp~%uint64 id_num~%~%================================================================================~%MSG: lidar_msgs/GPSPacket~%float64[3] ned_xyz~%float64[3] ned_uvw~%float64 heading~%uint8 gps_sats~%uint8 gps_mod~%uint64 timestamp~%uint64 id_num~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RecvPacket>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'laserpkt))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'imupkt))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'gpspkt))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RecvPacket>))
  "Converts a ROS message object to a list"
  (cl:list 'RecvPacket
    (cl:cons ':laserpkt (laserpkt msg))
    (cl:cons ':imupkt (imupkt msg))
    (cl:cons ':gpspkt (gpspkt msg))
))
