; Auto-generated. Do not edit!


(cl:in-package lidar_msgs-msg)


;//! \htmlinclude GPSPacket.msg.html

(cl:defclass <GPSPacket> (roslisp-msg-protocol:ros-message)
  ((ned_xyz
    :reader ned_xyz
    :initarg :ned_xyz
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0))
   (ned_uvw
    :reader ned_uvw
    :initarg :ned_uvw
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0))
   (heading
    :reader heading
    :initarg :heading
    :type cl:float
    :initform 0.0)
   (gps_sats
    :reader gps_sats
    :initarg :gps_sats
    :type cl:fixnum
    :initform 0)
   (gps_mod
    :reader gps_mod
    :initarg :gps_mod
    :type cl:fixnum
    :initform 0)
   (timestamp
    :reader timestamp
    :initarg :timestamp
    :type cl:integer
    :initform 0)
   (id_num
    :reader id_num
    :initarg :id_num
    :type cl:integer
    :initform 0))
)

(cl:defclass GPSPacket (<GPSPacket>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GPSPacket>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GPSPacket)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lidar_msgs-msg:<GPSPacket> is deprecated: use lidar_msgs-msg:GPSPacket instead.")))

(cl:ensure-generic-function 'ned_xyz-val :lambda-list '(m))
(cl:defmethod ned_xyz-val ((m <GPSPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lidar_msgs-msg:ned_xyz-val is deprecated.  Use lidar_msgs-msg:ned_xyz instead.")
  (ned_xyz m))

(cl:ensure-generic-function 'ned_uvw-val :lambda-list '(m))
(cl:defmethod ned_uvw-val ((m <GPSPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lidar_msgs-msg:ned_uvw-val is deprecated.  Use lidar_msgs-msg:ned_uvw instead.")
  (ned_uvw m))

(cl:ensure-generic-function 'heading-val :lambda-list '(m))
(cl:defmethod heading-val ((m <GPSPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lidar_msgs-msg:heading-val is deprecated.  Use lidar_msgs-msg:heading instead.")
  (heading m))

(cl:ensure-generic-function 'gps_sats-val :lambda-list '(m))
(cl:defmethod gps_sats-val ((m <GPSPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lidar_msgs-msg:gps_sats-val is deprecated.  Use lidar_msgs-msg:gps_sats instead.")
  (gps_sats m))

(cl:ensure-generic-function 'gps_mod-val :lambda-list '(m))
(cl:defmethod gps_mod-val ((m <GPSPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lidar_msgs-msg:gps_mod-val is deprecated.  Use lidar_msgs-msg:gps_mod instead.")
  (gps_mod m))

(cl:ensure-generic-function 'timestamp-val :lambda-list '(m))
(cl:defmethod timestamp-val ((m <GPSPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lidar_msgs-msg:timestamp-val is deprecated.  Use lidar_msgs-msg:timestamp instead.")
  (timestamp m))

(cl:ensure-generic-function 'id_num-val :lambda-list '(m))
(cl:defmethod id_num-val ((m <GPSPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lidar_msgs-msg:id_num-val is deprecated.  Use lidar_msgs-msg:id_num instead.")
  (id_num m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GPSPacket>) ostream)
  "Serializes a message object of type '<GPSPacket>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'ned_xyz))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'ned_uvw))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'heading))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'gps_sats)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'gps_mod)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'timestamp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'timestamp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'timestamp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'timestamp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'timestamp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'timestamp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'timestamp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'timestamp)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id_num)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'id_num)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'id_num)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'id_num)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'id_num)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'id_num)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'id_num)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'id_num)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GPSPacket>) istream)
  "Deserializes a message object of type '<GPSPacket>"
  (cl:setf (cl:slot-value msg 'ned_xyz) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'ned_xyz)))
    (cl:dotimes (i 3)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'ned_uvw) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'ned_uvw)))
    (cl:dotimes (i 3)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits)))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'heading) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'gps_sats)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'gps_mod)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'timestamp)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'timestamp)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'timestamp)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'timestamp)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'timestamp)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'timestamp)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'timestamp)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'timestamp)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id_num)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'id_num)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) (cl:slot-value msg 'id_num)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) (cl:slot-value msg 'id_num)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 32) (cl:slot-value msg 'id_num)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 40) (cl:slot-value msg 'id_num)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 48) (cl:slot-value msg 'id_num)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 56) (cl:slot-value msg 'id_num)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GPSPacket>)))
  "Returns string type for a message object of type '<GPSPacket>"
  "lidar_msgs/GPSPacket")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GPSPacket)))
  "Returns string type for a message object of type 'GPSPacket"
  "lidar_msgs/GPSPacket")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GPSPacket>)))
  "Returns md5sum for a message object of type '<GPSPacket>"
  "a75c55dfb0f58e67e04612fa1aa9ed1e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GPSPacket)))
  "Returns md5sum for a message object of type 'GPSPacket"
  "a75c55dfb0f58e67e04612fa1aa9ed1e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GPSPacket>)))
  "Returns full string definition for message of type '<GPSPacket>"
  (cl:format cl:nil "float64[3] ned_xyz~%float64[3] ned_uvw~%float64 heading~%uint8 gps_sats~%uint8 gps_mod~%uint64 timestamp~%uint64 id_num~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GPSPacket)))
  "Returns full string definition for message of type 'GPSPacket"
  (cl:format cl:nil "float64[3] ned_xyz~%float64[3] ned_uvw~%float64 heading~%uint8 gps_sats~%uint8 gps_mod~%uint64 timestamp~%uint64 id_num~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GPSPacket>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'ned_xyz) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'ned_uvw) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
     8
     1
     1
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GPSPacket>))
  "Converts a ROS message object to a list"
  (cl:list 'GPSPacket
    (cl:cons ':ned_xyz (ned_xyz msg))
    (cl:cons ':ned_uvw (ned_uvw msg))
    (cl:cons ':heading (heading msg))
    (cl:cons ':gps_sats (gps_sats msg))
    (cl:cons ':gps_mod (gps_mod msg))
    (cl:cons ':timestamp (timestamp msg))
    (cl:cons ':id_num (id_num msg))
))
