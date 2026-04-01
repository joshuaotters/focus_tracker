# Database schema
    users
      - id
      - email
      - hashed_password
      - inserted_at
      - updated_at
      
    projects
      - id
      - name
      - user_id (foreign key)
      - inserted_at
      - updated_at
      
    tasks
      - id
      - title
      - description (nullable)
      - status (enum: pending, in_progress, completed)
      - project_id (foreign key)
      - user_id (foreign key)
      - inserted_at
      - updated_at