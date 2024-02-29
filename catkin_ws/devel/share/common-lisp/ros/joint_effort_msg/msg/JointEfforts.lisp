; Auto-generated. Do not edit!


(cl:in-package joint_effort_msg-msg)


;//! \htmlinclude JointEfforts.msg.html

(cl:defclass <JointEfforts> (roslisp-msg-protocol:ros-message)
  ((Joint1Effort
    :reader Joint1Effort
    :initarg :Joint1Effort
    :type cl:float
    :initform 0.0)
   (Joint2Effort
    :reader Joint2Effort
    :initarg :Joint2Effort
    :type cl:float
    :initform 0.0)
   (Joint3Effort
    :reader Joint3Effort
    :initarg :Joint3Effort
    :type cl:float
    :initform 0.0)
   (Joint4Effort
    :reader Joint4Effort
    :initarg :Joint4Effort
    :type cl:float
    :initform 0.0)
   (Joint5Effort
    :reader Joint5Effort
    :initarg :Joint5Effort
    :type cl:float
    :initform 0.0)
   (Joint6Effort
    :reader Joint6Effort
    :initarg :Joint6Effort
    :type cl:float
    :initform 0.0))
)

(cl:defclass JointEfforts (<JointEfforts>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <JointEfforts>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'JointEfforts)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name joint_effort_msg-msg:<JointEfforts> is deprecated: use joint_effort_msg-msg:JointEfforts instead.")))

(cl:ensure-generic-function 'Joint1Effort-val :lambda-list '(m))
(cl:defmethod Joint1Effort-val ((m <JointEfforts>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader joint_effort_msg-msg:Joint1Effort-val is deprecated.  Use joint_effort_msg-msg:Joint1Effort instead.")
  (Joint1Effort m))

(cl:ensure-generic-function 'Joint2Effort-val :lambda-list '(m))
(cl:defmethod Joint2Effort-val ((m <JointEfforts>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader joint_effort_msg-msg:Joint2Effort-val is deprecated.  Use joint_effort_msg-msg:Joint2Effort instead.")
  (Joint2Effort m))

(cl:ensure-generic-function 'Joint3Effort-val :lambda-list '(m))
(cl:defmethod Joint3Effort-val ((m <JointEfforts>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader joint_effort_msg-msg:Joint3Effort-val is deprecated.  Use joint_effort_msg-msg:Joint3Effort instead.")
  (Joint3Effort m))

(cl:ensure-generic-function 'Joint4Effort-val :lambda-list '(m))
(cl:defmethod Joint4Effort-val ((m <JointEfforts>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader joint_effort_msg-msg:Joint4Effort-val is deprecated.  Use joint_effort_msg-msg:Joint4Effort instead.")
  (Joint4Effort m))

(cl:ensure-generic-function 'Joint5Effort-val :lambda-list '(m))
(cl:defmethod Joint5Effort-val ((m <JointEfforts>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader joint_effort_msg-msg:Joint5Effort-val is deprecated.  Use joint_effort_msg-msg:Joint5Effort instead.")
  (Joint5Effort m))

(cl:ensure-generic-function 'Joint6Effort-val :lambda-list '(m))
(cl:defmethod Joint6Effort-val ((m <JointEfforts>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader joint_effort_msg-msg:Joint6Effort-val is deprecated.  Use joint_effort_msg-msg:Joint6Effort instead.")
  (Joint6Effort m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <JointEfforts>) ostream)
  "Serializes a message object of type '<JointEfforts>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'Joint1Effort))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'Joint2Effort))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'Joint3Effort))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'Joint4Effort))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'Joint5Effort))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'Joint6Effort))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <JointEfforts>) istream)
  "Deserializes a message object of type '<JointEfforts>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Joint1Effort) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Joint2Effort) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Joint3Effort) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Joint4Effort) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Joint5Effort) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Joint6Effort) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<JointEfforts>)))
  "Returns string type for a message object of type '<JointEfforts>"
  "joint_effort_msg/JointEfforts")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'JointEfforts)))
  "Returns string type for a message object of type 'JointEfforts"
  "joint_effort_msg/JointEfforts")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<JointEfforts>)))
  "Returns md5sum for a message object of type '<JointEfforts>"
  "3d5515d02554fcac322f06400d9105c8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'JointEfforts)))
  "Returns md5sum for a message object of type 'JointEfforts"
  "3d5515d02554fcac322f06400d9105c8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<JointEfforts>)))
  "Returns full string definition for message of type '<JointEfforts>"
  (cl:format cl:nil "float64 Joint1Effort~%float64 Joint2Effort~%float64 Joint3Effort~%float64 Joint4Effort~%float64 Joint5Effort~%float64 Joint6Effort~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'JointEfforts)))
  "Returns full string definition for message of type 'JointEfforts"
  (cl:format cl:nil "float64 Joint1Effort~%float64 Joint2Effort~%float64 Joint3Effort~%float64 Joint4Effort~%float64 Joint5Effort~%float64 Joint6Effort~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <JointEfforts>))
  (cl:+ 0
     8
     8
     8
     8
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <JointEfforts>))
  "Converts a ROS message object to a list"
  (cl:list 'JointEfforts
    (cl:cons ':Joint1Effort (Joint1Effort msg))
    (cl:cons ':Joint2Effort (Joint2Effort msg))
    (cl:cons ':Joint3Effort (Joint3Effort msg))
    (cl:cons ':Joint4Effort (Joint4Effort msg))
    (cl:cons ':Joint5Effort (Joint5Effort msg))
    (cl:cons ':Joint6Effort (Joint6Effort msg))
))
