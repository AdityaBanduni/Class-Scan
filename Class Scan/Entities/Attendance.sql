{
  "name": "Attendance",
  "type": "object",
  "properties": {
    "student_id": {
      "type": "string",
      "description": "Reference to student"
    },
    "date": {
      "type": "string",
      "format": "date",
      "description": "Date of attendance"
    },
    "time_in": {
      "type": "string",
      "format": "time",
      "description": "Time student arrived"
    },
    "status": {
      "type": "string",
      "enum": [
        "present",
        "absent",
        "late"
      ],
      "default": "present",
      "description": "Attendance status"
    },
    "detection_method": {
      "type": "string",
      "enum": [
        "camera",
        "manual"
      ],
      "description": "How attendance was recorded"
    },
    "confidence_score": {
      "type": "number",
      "description": "Face recognition confidence (0-1)"
    },
    "notes": {
      "type": "string",
      "description": "Additional notes"
    }
  },
  "required": [
    "student_id",
    "date"
  ],
  "rls": {
    "read": {
      "$or": [
        {
          "created_by": "{{user.email}}"
        },
        {
          "user_condition": {
            "role": "admin"
          }
        }
      ]
    },
    "write": {
      "$or": [
        {
          "created_by": "{{user.email}}"
        },
        {
          "user_condition": {
            "role": "admin"
          }
        }
      ]
    }
  }
}