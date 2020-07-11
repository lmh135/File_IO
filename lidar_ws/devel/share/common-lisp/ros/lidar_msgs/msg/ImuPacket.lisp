; Auto-generated. Do not edit!


(cl:in-package lidar_msgs-msg)


;//! \htmlinclude ImuPacket.msg.html

(cl:defclass <ImuPacket> (roslisp-msg-protocol:ros-message)
  ((imu_gyro
    :reader imu_gyro
    :initarg :imu_gyro
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0))
   (imu_accel
    :reader imu_accel
    :initarg :imu_accel
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0))
   (imu_magn
    :reader imu_magn
    :initarg :imu_magn
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0))
   (imu_euler
    :reader imu_euler
    :initarg :imu_euler
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0))
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

(cl:defclass ImuPacket (<ImuPacket>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ImuPacket>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ImuPacket)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name lidar_msgs-msg:<ImuPacket> is deprecated: use lidar_msgs-msg:ImuPacket instead.")))

(cl:ensure-generic-function 'imu_gyro-val :lambda-list '(m))
(cl:defmethod imu_gyro-val ((m <ImuPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lidar_msgs-msg:imu_gyro-val is deprecated.  Use lidar_msgs-msg:imu_gyro instead.")
  (imu_gyro m))

(cl:ensure-generic-function 'imu_accel-val :lambda-list '(m))
(cl:defmethod imu_accel-val ((m <ImuPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lidar_msgs-msg:imu_accel-val is deprecated.  Use lidar_msgs-msg:imu_accel instead.")
  (imu_accel m))

(cl:ensure-generic-function 'imu_magn-val :lambda-list '(m))
(cl:defmethod imu_magn-val ((m <ImuPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lidar_msgs-msg:imu_magn-val is deprecated.  Use lidar_msgs-msg:imu_magn instead.")
  (imu_magn m))

(cl:ensure-generic-function 'imu_euler-val :lambda-list '(m))
(cl:defmethod imu_euler-val ((m <ImuPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lidar_msgs-msg:imu_euler-val is deprecated.  Use lidar_msgs-msg:imu_euler instead.")
  (imu_euler m))

(cl:ensure-generic-function 'timestamp-val :lambda-list '(m))
(cl:defmethod timestamp-val ((m <ImuPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lidar_msgs-msg:timestamp-val is deprecated.  Use lidar_msgs-msg:timestamp instead.")
  (timestamp m))

(cl:ensure-generic-function 'id_num-val :lambda-list '(m))
(cl:defmethod id_num-val ((m <ImuPacket>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader lidar_msgs-msg:id_num-val is deprecated.  Use lidar_msgs-msg:id_num instead.")
  (id_num m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ImuPacket>) ostream)
  "Serializes a message object of type '<ImuPacket>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'imu_gyro))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'imu_accel))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'imu_magn))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'imu_euler))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ImuPacket>) istream)
  "Deserializes a message object of type '<ImuPacket>"
  (cl:setf (cl:slot-value msg 'imu_gyro) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'imu_gyro)))
    (cl:dotimes (i 3)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'imu_accel) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'imu_accel)))
    (cl:dotimes (i 3)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'imu_magn) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'imu_magn)))
    (cl:dotimes (i 3)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  (cl:setf (cl:slot-value msg 'imu_euler) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'imu_euler)))
    (cl:dotimes (i 3)
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ImuPacket>)))
  "Returns string type for a message object of type '<ImuPacket>"
  "lidar_msgs/ImuPacket")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ImuPacket)))
  "Returns string type for a message object of type 'ImuPacket"
  "lidar_msgs/ImuPacket")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ImuPacket>)))
  "Returns md5sum for a message object of type '<ImuPacket>"
  "a8ec3aca7e5b627e23bc444ef30e8bcd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ImuPacket)))
  "Returns md5sum for a message object of type 'ImuPacket"
  "a8ec3aca7e5b627e23bc444ef30e8bcd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ImuPacket>)))
  "Returns full string definition for message of type '<ImuPacket>"
  (cl:format cl:nil "float32[3] imu_gyro~%float32[3] imu_accel~%float32[3] imu_magn~%float32[3] imu_euler~%uint64 timestamp~%uint64 id_num~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ImuPacket)))
  "Returns full string definition for message of type 'ImuPacket"
  (cl:format cl:nil "float32[3] imu_gyro~%float32[3] imu_accel~%float32[3] imu_magn~%float32[3] imu_euler~%uint64 timestamp~%uint64 id_num~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ImuPacket>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'imu_gyro) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'imu_accel) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'imu_magn) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'imu_euler) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ImuPacket>))
  "Converts a ROS message object to a list"
  (cl:list 'ImuPacket
    (cl:cons ':imu_gyro (imu_gyro msg))
    (cl:cons ':imu_accel (imu_accel msg))
    (cl:cons ':imu_magn (imu_magn msg))
    (cl:cons ':imu_euler (imu_euler msg))
    (cl:cons ':timestamp (timestamp msg))
    (cl:cons ':id_num (id_num msg))
))
