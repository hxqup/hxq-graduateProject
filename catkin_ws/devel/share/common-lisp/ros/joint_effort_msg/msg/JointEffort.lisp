; Auto-generated. Do not edit!


(cl:in-package joint_effort_msg-msg)


;//! \htmlinclude JointEffort.msg.html

(cl:defclass <JointEffort> (roslisp-msg-protocol:ros-message)
  ((effort
    :reader effort
    :initarg :effort
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass JointEffort (<JointEffort>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <JointEffort>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'JointEffort)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name joint_effort_msg-msg:<JointEffort> is deprecated: use joint_effort_msg-msg:JointEffort instead.")))

(cl:ensure-generic-function 'effort-val :lambda-list '(m))
(cl:defmethod effort-val ((m <JointEffort>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader joint_effort_msg-msg:effort-val is deprecated.  Use joint_effort_msg-msg:effort instead.")
  (effort m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <JointEffort>) ostream)
  "Serializes a message object of type '<JointEffort>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'effort))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-double-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream)))
   (cl:slot-value msg 'effort))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <JointEffort>) istream)
  "Deserializes a message object of type '<JointEffort>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'effort) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'effort)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-double-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<JointEffort>)))
  "Returns string type for a message object of type '<JointEffort>"
  "joint_effort_msg/JointEffort")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'JointEffort)))
  "Returns string type for a message object of type 'JointEffort"
  "joint_effort_msg/JointEffort")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<JointEffort>)))
  "Returns md5sum for a message object of type '<JointEffort>"
  "3a8f7ca4b38fbe820a7205cc08e38abf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'JointEffort)))
  "Returns md5sum for a message object of type 'JointEffort"
  "3a8f7ca4b38fbe820a7205cc08e38abf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<JointEffort>)))
  "Returns full string definition for message of type '<JointEffort>"
  (cl:format cl:nil "float64[] effort~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'JointEffort)))
  "Returns full string definition for message of type 'JointEffort"
  (cl:format cl:nil "float64[] effort~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <JointEffort>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'effort) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 8)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <JointEffort>))
  "Converts a ROS message object to a list"
  (cl:list 'JointEffort
    (cl:cons ':effort (effort msg))
))
