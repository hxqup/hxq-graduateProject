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

class JointEffort {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.effort = null;
    }
    else {
      if (initObj.hasOwnProperty('effort')) {
        this.effort = initObj.effort
      }
      else {
        this.effort = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type JointEffort
    // Serialize message field [effort]
    bufferOffset = _arraySerializer.float64(obj.effort, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type JointEffort
    let len;
    let data = new JointEffort(null);
    // Deserialize message field [effort]
    data.effort = _arrayDeserializer.float64(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 8 * object.effort.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'joint_effort_msg/JointEffort';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3a8f7ca4b38fbe820a7205cc08e38abf';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64[] effort
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new JointEffort(null);
    if (msg.effort !== undefined) {
      resolved.effort = msg.effort;
    }
    else {
      resolved.effort = []
    }

    return resolved;
    }
};

module.exports = JointEffort;
