;; Auto-generated. Do not edit!


(when (boundp 'joint_effort_msg::JointEffort)
  (if (not (find-package "JOINT_EFFORT_MSG"))
    (make-package "JOINT_EFFORT_MSG"))
  (shadow 'JointEffort (find-package "JOINT_EFFORT_MSG")))
(unless (find-package "JOINT_EFFORT_MSG::JOINTEFFORT")
  (make-package "JOINT_EFFORT_MSG::JOINTEFFORT"))

(in-package "ROS")
;;//! \htmlinclude JointEffort.msg.html


(defclass joint_effort_msg::JointEffort
  :super ros::object
  :slots (_effort ))

(defmethod joint_effort_msg::JointEffort
  (:init
   (&key
    ((:effort __effort) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _effort __effort)
   self)
  (:effort
   (&optional __effort)
   (if __effort (setq _effort __effort)) _effort)
  (:serialization-length
   ()
   (+
    ;; float64[] _effort
    (* 8    (length _effort)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64[] _effort
     (write-long (length _effort) s)
     (dotimes (i (length _effort))
       (sys::poke (elt _effort i) (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64[] _effort
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _effort (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _effort i) (sys::peek buf ptr- :double)) (incf ptr- 8)
     ))
   ;;
   self)
  )

(setf (get joint_effort_msg::JointEffort :md5sum-) "3a8f7ca4b38fbe820a7205cc08e38abf")
(setf (get joint_effort_msg::JointEffort :datatype-) "joint_effort_msg/JointEffort")
(setf (get joint_effort_msg::JointEffort :definition-)
      "float64[] effort

")



(provide :joint_effort_msg/JointEffort "3a8f7ca4b38fbe820a7205cc08e38abf")


