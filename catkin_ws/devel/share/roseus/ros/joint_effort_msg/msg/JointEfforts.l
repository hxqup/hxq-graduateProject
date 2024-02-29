;; Auto-generated. Do not edit!


(when (boundp 'joint_effort_msg::JointEfforts)
  (if (not (find-package "JOINT_EFFORT_MSG"))
    (make-package "JOINT_EFFORT_MSG"))
  (shadow 'JointEfforts (find-package "JOINT_EFFORT_MSG")))
(unless (find-package "JOINT_EFFORT_MSG::JOINTEFFORTS")
  (make-package "JOINT_EFFORT_MSG::JOINTEFFORTS"))

(in-package "ROS")
;;//! \htmlinclude JointEfforts.msg.html


(defclass joint_effort_msg::JointEfforts
  :super ros::object
  :slots (_Joint1Effort _Joint2Effort _Joint3Effort _Joint4Effort _Joint5Effort _Joint6Effort ))

(defmethod joint_effort_msg::JointEfforts
  (:init
   (&key
    ((:Joint1Effort __Joint1Effort) 0.0)
    ((:Joint2Effort __Joint2Effort) 0.0)
    ((:Joint3Effort __Joint3Effort) 0.0)
    ((:Joint4Effort __Joint4Effort) 0.0)
    ((:Joint5Effort __Joint5Effort) 0.0)
    ((:Joint6Effort __Joint6Effort) 0.0)
    )
   (send-super :init)
   (setq _Joint1Effort (float __Joint1Effort))
   (setq _Joint2Effort (float __Joint2Effort))
   (setq _Joint3Effort (float __Joint3Effort))
   (setq _Joint4Effort (float __Joint4Effort))
   (setq _Joint5Effort (float __Joint5Effort))
   (setq _Joint6Effort (float __Joint6Effort))
   self)
  (:Joint1Effort
   (&optional __Joint1Effort)
   (if __Joint1Effort (setq _Joint1Effort __Joint1Effort)) _Joint1Effort)
  (:Joint2Effort
   (&optional __Joint2Effort)
   (if __Joint2Effort (setq _Joint2Effort __Joint2Effort)) _Joint2Effort)
  (:Joint3Effort
   (&optional __Joint3Effort)
   (if __Joint3Effort (setq _Joint3Effort __Joint3Effort)) _Joint3Effort)
  (:Joint4Effort
   (&optional __Joint4Effort)
   (if __Joint4Effort (setq _Joint4Effort __Joint4Effort)) _Joint4Effort)
  (:Joint5Effort
   (&optional __Joint5Effort)
   (if __Joint5Effort (setq _Joint5Effort __Joint5Effort)) _Joint5Effort)
  (:Joint6Effort
   (&optional __Joint6Effort)
   (if __Joint6Effort (setq _Joint6Effort __Joint6Effort)) _Joint6Effort)
  (:serialization-length
   ()
   (+
    ;; float64 _Joint1Effort
    8
    ;; float64 _Joint2Effort
    8
    ;; float64 _Joint3Effort
    8
    ;; float64 _Joint4Effort
    8
    ;; float64 _Joint5Effort
    8
    ;; float64 _Joint6Effort
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _Joint1Effort
       (sys::poke _Joint1Effort (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _Joint2Effort
       (sys::poke _Joint2Effort (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _Joint3Effort
       (sys::poke _Joint3Effort (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _Joint4Effort
       (sys::poke _Joint4Effort (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _Joint5Effort
       (sys::poke _Joint5Effort (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _Joint6Effort
       (sys::poke _Joint6Effort (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _Joint1Effort
     (setq _Joint1Effort (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _Joint2Effort
     (setq _Joint2Effort (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _Joint3Effort
     (setq _Joint3Effort (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _Joint4Effort
     (setq _Joint4Effort (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _Joint5Effort
     (setq _Joint5Effort (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _Joint6Effort
     (setq _Joint6Effort (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get joint_effort_msg::JointEfforts :md5sum-) "3d5515d02554fcac322f06400d9105c8")
(setf (get joint_effort_msg::JointEfforts :datatype-) "joint_effort_msg/JointEfforts")
(setf (get joint_effort_msg::JointEfforts :definition-)
      "float64 Joint1Effort
float64 Joint2Effort
float64 Joint3Effort
float64 Joint4Effort
float64 Joint5Effort
float64 Joint6Effort
")



(provide :joint_effort_msg/JointEfforts "3d5515d02554fcac322f06400d9105c8")


