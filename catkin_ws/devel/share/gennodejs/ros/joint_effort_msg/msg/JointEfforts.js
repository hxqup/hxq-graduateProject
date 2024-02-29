// Auto-generated. Do not edit!

// (in-package joint_effort_msg.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class JointEfforts {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.Joint1Effort = null;
      this.Joint2Effort = null;
      this.Joint3Effort = null;
      this.Joint4Effort = null;
      this.Joint5Effort = null;
      this.Joint6Effort = null;
    }
    else {
      if (initObj.hasOwnProperty('Joint1Effort')) {
        this.Joint1Effort = initObj.Joint1Effort
      }
      else {
        this.Joint1Effort = 0.0;
      }
      if (initObj.hasOwnProperty('Joint2Effort')) {
        this.Joint2Effort = initObj.Joint2Effort
      }
      else {
        this.Joint2Effort = 0.0;
      }
      if (initObj.hasOwnProperty('Joint3Effort')) {
        this.Joint3Effort = initObj.Joint3Effort
      }
      else {
        this.Joint3Effort = 0.0;
      }
      if (initObj.hasOwnProperty('Joint4Effort')) {
        this.Joint4Effort = initObj.Joint4Effort
      }
      else {
        this.Joint4Effort = 0.0;
      }
      if (initObj.hasOwnProperty('Joint5Effort')) {
        this.Joint5Effort = initObj.Joint5Effort
      }
      else {
        this.Joint5Effort = 0.0;
      }
      if (initObj.hasOwnProperty('Joint6Effort')) {
        this.Joint6Effort = initObj.Joint6Effort
      }
      else {
        this.Joint6Effort = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type JointEfforts
    // Serialize message field [Joint1Effort]
    bufferOffset = _serializer.float64(obj.Joint1Effort, buffer, bufferOffset);
    // Serialize message field [Joint2Effort]
    bufferOffset = _serializer.float64(obj.Joint2Effort, buffer, bufferOffset);
    // Serialize message field [Joint3Effort]
    bufferOffset = _serializer.float64(obj.Joint3Effort, buffer, bufferOffset);
    // Serialize message field [Joint4Effort]
    bufferOffset = _serializer.float64(obj.Joint4Effort, buffer, bufferOffset);
    // Serialize message field [Joint5Effort]
    bufferOffset = _serializer.float64(obj.Joint5Effort, buffer, bufferOffset);
    // Serialize message field [Joint6Effort]
    bufferOffset = _serializer.float64(obj.Joint6Effort, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type JointEfforts
    let len;
    let data = new JointEfforts(null);
    // Deserialize message field [Joint1Effort]
    data.Joint1Effort = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [Joint2Effort]
    data.Joint2Effort = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [Joint3Effort]
    data.Joint3Effort = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [Joint4Effort]
    data.Joint4Effort = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [Joint5Effort]
    data.Joint5Effort = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [Joint6Effort]
    data.Joint6Effort = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 48;
  }

  static datatype() {
    // Returns string type for a message object
    return 'joint_effort_msg/JointEfforts';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3d5515d02554fcac322f06400d9105c8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 Joint1Effort
    float64 Joint2Effort
    float64 Joint3Effort
    float64 Joint4Effort
    float64 Joint5Effort
    float64 Joint6Effort
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new JointEfforts(null);
    if (msg.Joint1Effort !== undefined) {
      resolved.Joint1Effort = msg.Joint1Effort;
    }
    else {
      resolved.Joint1Effort = 0.0
    }

    if (msg.Joint2Effort !== undefined) {
      resolved.Joint2Effort = msg.Joint2Effort;
    }
    else {
      resolved.Joint2Effort = 0.0
    }

    if (msg.Joint3Effort !== undefined) {
      resolved.Joint3Effort = msg.Joint3Effort;
    }
    else {
      resolved.Joint3Effort = 0.0
    }

    if (msg.Joint4Effort !== undefined) {
      resolved.Joint4Effort = msg.Joint4Effort;
    }
    else {
      resolved.Joint4Effort = 0.0
    }

    if (msg.Joint5Effort !== undefined) {
      resolved.Joint5Effort = msg.Joint5Effort;
    }
    else {
      resolved.Joint5Effort = 0.0
    }

    if (msg.Joint6Effort !== undefined) {
      resolved.Joint6Effort = msg.Joint6Effort;
    }
    else {
      resolved.Joint6Effort = 0.0
    }

    return resolved;
    }
};

module.exports = JointEfforts;
