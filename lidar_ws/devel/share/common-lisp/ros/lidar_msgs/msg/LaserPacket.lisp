; Auto-generated. Do not edit!


(cl:in-package lidar_msgs-msg)


;//! \htmlinclude LaserPacket.msg.html

(cl:defclass <LaserPacket> (roslisp-msg-protocol:ros-message)
  ((Azimuth
    :reader Azimuth
    :initarg :Azimuth
    :type (cl:vector cl:float)
   :initform (cl:make-array 12 :element-type 'cl:float :initial-element 0.0))
   (distance
    :reader distance
    :initarg :distance
    :type (cl:vector cl:float)
   :initform (cl:make-array 192 :element-type 'cl:float :initial-element 0.0))
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

(cl:defclass LaserPacket (<LaserPacket>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <LaserPacket>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'LaserPacket)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lidar_msgs-msg:<LaserPacket> is deprecated: use lidar_msgs-msg:LaserPacket instead.")))

(cl:ensure-generic-function 'Azimuth-val :lambda-list '(m))
(cl:defmethod Azimuth-val ((m <LaserPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lidar_msgs-msg:Azimuth-val is deprecated.  Use lidar_msgs-msg:Azimuth instead.")
  (Azimuth m))

(cl:ensure-generic-function 'distance-val :lambda-list '(m))
(cl:defmethod distance-val ((m <LaserPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lidar_msgs-msg:distance-val is deprecated.  Use lidar_msgs-msg:distance instead.")
  (distance m))

(cl:ensure-generic-function 'timestamp-val :lambda-list '(m))
(cl:defmethod timestamp-val ((m <LaserPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lidar_msgs-msg:timestamp-val is deprecated.  Use lidar_msgs-msg:timestamp instead.")
  (timestamp m))

(cl:ensure-generic-function 'id_num-val :lambda-list '(m))
(cl:defmethod id_num-val ((m <LaserPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lidar_msgs-msg:id_num-val is deprecated.  Use lidar_msgs-msg:id_num instead.")
  (id_num m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <LaserPacket>) ostream)
  "Serializes a message object of type '<LaserPacket>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'Azimuth))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'distance))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <LaserPacket>) istream)
  "Deserializes a message object of type '<LaserPacket>"
  (cl:setf (cl:slot-value msg 'Azimuth) (cl:make-array 12))
  (cl:let ((vals (cl:slot-value msg 'Azimuth)))
    (cl:dotimes (i 12)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'distance) (cl:make-array 192))
  (cl:let ((vals (cl:slot-value msg 'distance)))
    (cl:dotimes (i 192)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<LaserPacket>)))
  "Returns string type for a message object of type '<LaserPacket>"
  "lidar_msgs/LaserPacket")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'LaserPacket)))
  "Returns string type for a message object of type 'LaserPacket"
  "lidar_msgs/LaserPacket")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<LaserPacket>)))
  "Returns md5sum for a message object of type '<LaserPacket>"
  "61992e7cac699d037e7a874f2eedcf02")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'LaserPacket)))
  "Returns md5sum for a message object of type 'LaserPacket"
  "61992e7cac699d037e7a874f2eedcf02")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<LaserPacket>)))
  "Returns full string definition for message of type '<LaserPacket>"
  (cl:format cl:nil "float32[12] Azimuth~%float32[192] distance~%uint64 timestamp~%uint64 id_num~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'LaserPacket)))
  "Returns full string definition for message of type 'LaserPacket"
  (cl:format cl:nil "float32[12] Azimuth~%float32[192] distance~%uint64 timestamp~%uint64 id_num~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <LaserPacket>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'Azimuth) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'distance) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <LaserPacket>))
  "Converts a ROS message object to a list"
  (cl:list 'LaserPacket
    (cl:cons ':Azimuth (Azimuth msg))
    (cl:cons ':distance (distance msg))
    (cl:cons ':timestamp (timestamp msg))
    (cl:cons ':id_num (id_num msg))
))
