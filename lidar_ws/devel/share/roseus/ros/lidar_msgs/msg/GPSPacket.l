;; Auto-generated. Do not edit!


(when (boundp 'lidar_msgs::GPSPacket)
  (if (not (find-package "LIDAR_MSGS"))
    (make-package "LIDAR_MSGS"))
  (shadow 'GPSPacket (find-package "LIDAR_MSGS")))
(unless (find-package "LIDAR_MSGS::GPSPACKET")
  (make-package "LIDAR_MSGS::GPSPACKET"))

(in-package "ROS")
;;//! \htmlinclude GPSPacket.msg.html


(defclass lidar_msgs::GPSPacket
  :super ros::object
  :slots (_ned_xyz _ned_uvw _heading _gps_sats _gps_mod _timestamp _id_num ))

(defmethod lidar_msgs::GPSPacket
  (:init
   (&key
    ((:ned_xyz __ned_xyz) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:ned_uvw __ned_uvw) (make-array 3 :initial-element 0.0 :element-type :float))
    ((:heading __heading) 0.0)
    ((:gps_sats __gps_sats) 0)
    ((:gps_mod __gps_mod) 0)
    ((:timestamp __timestamp) 0)
    ((:id_num __id_num) 0)
    )
   (send-super :init)
   (setq _ned_xyz __ned_xyz)
   (setq _ned_uvw __ned_uvw)
   (setq _heading (float __heading))
   (setq _gps_sats (round __gps_sats))
   (setq _gps_mod (round __gps_mod))
   (setq _timestamp (round __timestamp))
   (setq _id_num (round __id_num))
   self)
  (:ned_xyz
   (&optional __ned_xyz)
   (if __ned_xyz (setq _ned_xyz __ned_xyz)) _ned_xyz)
  (:ned_uvw
   (&optional __ned_uvw)
   (if __ned_uvw (setq _ned_uvw __ned_uvw)) _ned_uvw)
  (:heading
   (&optional __heading)
   (if __heading (setq _heading __heading)) _heading)
  (:gps_sats
   (&optional __gps_sats)
   (if __gps_sats (setq _gps_sats __gps_sats)) _gps_sats)
  (:gps_mod
   (&optional __gps_mod)
   (if __gps_mod (setq _gps_mod __gps_mod)) _gps_mod)
  (:timestamp
   (&optional __timestamp)
   (if __timestamp (setq _timestamp __timestamp)) _timestamp)
  (:id_num
   (&optional __id_num)
   (if __id_num (setq _id_num __id_num)) _id_num)
  (:serialization-length
   ()
   (+
    ;; float64[3] _ned_xyz
    (* 8    3)
    ;; float64[3] _ned_uvw
    (* 8    3)
    ;; float64 _heading
    8
    ;; uint8 _gps_sats
    1
    ;; uint8 _gps_mod
    1
    ;; uint64 _timestamp
    8
    ;; uint64 _id_num
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[3] _ned_xyz
     (dotimes (i 3)
       (sys::poke (elt _ned_xyz i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64[3] _ned_uvw
     (dotimes (i 3)
       (sys::poke (elt _ned_uvw i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;; float64 _heading
       (sys::poke _heading (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; uint8 _gps_sats
       (write-byte _gps_sats s)
     ;; uint8 _gps_mod
       (write-byte _gps_mod s)
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
   ;; float64[3] _ned_xyz
   (dotimes (i (length _ned_xyz))
     (setf (elt _ned_xyz i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64[3] _ned_uvw
   (dotimes (i (length _ned_uvw))
     (setf (elt _ned_uvw i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     )
   ;; float64 _heading
     (setq _heading (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; uint8 _gps_sats
     (setq _gps_sats (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _gps_mod
     (setq _gps_mod (sys::peek buf ptr- :char)) (incf ptr- 1)
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

(setf (get lidar_msgs::GPSPacket :md5sum-) "a75c55dfb0f58e67e04612fa1aa9ed1e")
(setf (get lidar_msgs::GPSPacket :datatype-) "lidar_msgs/GPSPacket")
(setf (get lidar_msgs::GPSPacket :definition-)
      "float64[3] ned_xyz
float64[3] ned_uvw
float64 heading
uint8 gps_sats
uint8 gps_mod
uint64 timestamp
uint64 id_num

")



(provide :lidar_msgs/GPSPacket "a75c55dfb0f58e67e04612fa1aa9ed1e")


