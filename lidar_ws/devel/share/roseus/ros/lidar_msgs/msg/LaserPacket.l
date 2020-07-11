;; Auto-generated. Do not edit!


(when (boundp 'lidar_msgs::LaserPacket)
  (if (not (find-package "LIDAR_MSGS"))
    (make-package "LIDAR_MSGS"))
  (shadow 'LaserPacket (find-package "LIDAR_MSGS")))
(unless (find-package "LIDAR_MSGS::LASERPACKET")
  (make-package "LIDAR_MSGS::LASERPACKET"))

(in-package "ROS")
;;//! \htmlinclude LaserPacket.msg.html


(defclass lidar_msgs::LaserPacket
  :super ros::object
  :slots (_Azimuth _distance _timestamp _id_num ))

(defmethod lidar_msgs::LaserPacket
  (:init
   (&key
    ((:Azimuth __Azimuth) (make-array 12 :initial-element 0.0 :element-type :float))
    ((:distance __distance) (make-array 192 :initial-element 0.0 :element-type :float))
    ((:timestamp __timestamp) 0)
    ((:id_num __id_num) 0)
    )
   (send-super :init)
   (setq _Azimuth __Azimuth)
   (setq _distance __distance)
   (setq _timestamp (round __timestamp))
   (setq _id_num (round __id_num))
   self)
  (:Azimuth
   (&optional __Azimuth)
   (if __Azimuth (setq _Azimuth __Azimuth)) _Azimuth)
  (:distance
   (&optional __distance)
   (if __distance (setq _distance __distance)) _distance)
  (:timestamp
   (&optional __timestamp)
   (if __timestamp (setq _timestamp __timestamp)) _timestamp)
  (:id_num
   (&optional __id_num)
   (if __id_num (setq _id_num __id_num)) _id_num)
  (:serialization-length
   ()
   (+
    ;; float32[12] _Azimuth
    (* 4    12)
    ;; float32[192] _distance
    (* 4    192)
    ;; uint64 _timestamp
    8
    ;; uint64 _id_num
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[12] _Azimuth
     (dotimes (i 12)
       (sys::poke (elt _Azimuth i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;; float32[192] _distance
     (dotimes (i 192)
       (sys::poke (elt _distance i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
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
   ;; float32[12] _Azimuth
   (dotimes (i (length _Azimuth))
     (setf (elt _Azimuth i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     )
   ;; float32[192] _distance
   (dotimes (i (length _distance))
     (setf (elt _distance i) (sys::peek buf ptr- :float)) (incf ptr- 4)
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

(setf (get lidar_msgs::LaserPacket :md5sum-) "61992e7cac699d037e7a874f2eedcf02")
(setf (get lidar_msgs::LaserPacket :datatype-) "lidar_msgs/LaserPacket")
(setf (get lidar_msgs::LaserPacket :definition-)
      "float32[12] Azimuth
float32[192] distance
uint64 timestamp
uint64 id_num

")



(provide :lidar_msgs/LaserPacket "61992e7cac699d037e7a874f2eedcf02")


