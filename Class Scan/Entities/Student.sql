{
  "name": "Student",
  "type": "object",
  "properties": {
    "full_name": {
      "type": "string",
      "description": "Student's full name"
    },
    "student_id": {
      "type": "string",
      "description": "Unique student identifier"
    },
    "grade": {
      "type": "string",
      "description": "Student's grade level"
    },
    "photo_url": {
      "type": "string",
      "description": "URL to student's photo for face recognition"
    },
    "email": {
      "type": "string",
      "format": "email",
      "description": "Student's email address"
    },
    "parent_email": {
      "type": "string",
      "format": "email",
      "description": "Parent/guardian email"
    },
    "status": {
      "type": "string",
      "enum": [
        "active",
        "inactive"
      ],
      "default": "active",
      "description": "Student enrollment status"
    }
  },
  "required": [
    "full_name",
    "student_id"
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