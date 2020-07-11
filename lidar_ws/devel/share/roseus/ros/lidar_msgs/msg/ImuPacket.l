;; Auto-generated. Do not edit!


(when (boundp 'lidar_msgs::ImuPacket)
  (if (not (find-package "LIDAR_MSGS"))
    (make-package "LIDAR_MSGS"))
  (shadow 'ImuPacket (find-package "LIDAR_MSGS")))
(unless (find-package "LIDAR_MSGS::IMUPACKET")
  (make-package "LIDAR_MSGS::IMUPACKET"))

(in-package "ROS")
;;//! \htmlinclude ImuPacket.msg.html


(defclass lidar_msgs::ImuPacket
  :super ros::object
  :slots (_imu_gyro _imu_accel _imu_magn _imu_euler _timestamp _id_num ))

(defmethod lidar_msgs::ImuPacket
  (:init
   (&key
    ((:imu_gyro __imu_gyro) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:imu_accel __imu_accel) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:imu_magn __imu_magn) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:imu_euler __imu_euler) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:timestamp __timestamp) 0)
    ((:id_num __id_num) 0)
    )
   (send-super :init)
   (setq _imu_gyro __imu_gyro)
   (setq _imu_accel __imu_accel)
   (setq _imu_magn __imu_magn)
   (setq _imu_euler __imu_euler)
   (setq _timestamp (round __timestamp))
   (setq _id_num (round __id_num))
   self)
  (:imu_gyro
   (&optional __imu_gyro)
   (if __imu_gyro (setq _imu_gyro __imu_gyro)) _imu_gyro)
  (:imu_accel
   (&optional __imu_accel)
   (if __imu_accel (setq _imu_accel __imu_accel)) _imu_accel)
  (:imu_magn
   (&optional __imu_magn)
   (if __imu_magn (setq _imu_magn __imu_magn)) _imu_magn)
  (:imu_euler
   (&optional __imu_euler)
   (if __imu_euler (setq _imu_euler __imu_euler)) _imu_euler)
  (:timestamp
   (&optional __timestamp)
   (if __timestamp (setq _timestamp __timestamp)) _timestamp)
  (:id_num
   (&optional __id_num)
   (if __id_num (setq _id_num __id_num)) _id_num)
  (:serialization-length
   ()
   (+
    ;; float32[3] _imu_gyro
    (* 4    3)
    ;; float32[3] _imu_accel
    (* 4    3)
    ;; float32[3] _imu_magn
    (* 4    3)
    ;; float32[3] _imu_euler
    (* 4    3)
    ;; uint64 _timestamp
    8
    ;; uint64 _id_num
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[3] _imu_gyro
     (dotimes (i 3)
       (sys::poke (elt _imu_gyro i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[3] _imu_accel
     (dotimes (i 3)
       (sys::poke (elt _imu_accel i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[3] _imu_magn
     (dotimes (i 3)
       (sys::poke (elt _imu_magn i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[3] _imu_euler
     (dotimes (i 3)
       (sys::poke (elt _imu_euler i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; uint64 _timestamp
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _timestamp (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _timestamp) (= (length (_timestamp . bv)) 2)) ;; bignum
              (write-long (ash (elt (_timestamp . bv) 0) 0) s)
              (write-long (ash (elt (_timestamp . bv) 1) -1) s))
             ((and (class _timestamp) (= (length (_timestamp . bv)) 1)) ;; big1
              (write-long (elt (_timestamp . bv) 0) s)
              (write-long (if (>= _timestamp 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _timestamp s)(write-long (if (>= _timestamp 0) 0 #xffffffff) s)))
     ;; uint64 _id_num
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _id_num (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _id_num) (= (length (_id_num . bv)) 2)) ;; bignum
              (write-long (ash (elt (_id_num . bv) 0) 0) s)
              (write-long (ash (elt (_id_num . bv) 1) -1) s))
             ((and (class _id_num) (= (length (_id_num . bv)) 1)) ;; big1
              (write-long (elt (_id_num . bv) 0) s)
              (write-long (if (>= _id_num 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _id_num s)(write-long (if (>= _id_num 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[3] _imu_gyro
   (dotimes (i (length _imu_gyro))
     (setf (elt _imu_gyro i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32[3] _imu_accel
   (dotimes (i (length _imu_accel))
     (setf (elt _imu_accel i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32[3] _imu_magn
   (dotimes (i (length _imu_magn))
     (setf (elt _imu_magn i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32[3] _imu_euler
   (dotimes (i (length _imu_euler))
     (setf (elt _imu_euler i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; uint64 _timestamp
     
#+(or :alpha :irix6 :x86_64)
      (setf _timestamp (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _timestamp (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; uint64 _id_num
     
#+(or :alpha :irix6 :x86_64)
      (setf _id_num (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _id_num (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(setf (get lidar_msgs::ImuPacket :md5sum-) "a8ec3aca7e5b627e23bc444ef30e8bcd")
(setf (get lidar_msgs::ImuPacket :datatype-) "lidar_msgs/ImuPacket")
(setf (get lidar_msgs::ImuPacket :definition-)
      "float32[3] imu_gyro
float32[3] imu_accel
float32[3] imu_magn
float32[3] imu_euler
uint64 timestamp
uint64 id_num

")



(provide :lidar_msgs/ImuPacket "a8ec3aca7e5b627e23bc444ef30e8bcd")


