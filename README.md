# App Name: FocusTracker

# Description: 
- A task manager that prevents context-switching using real-time updates.
      
## Features
- [ ] User authentication
- [ ] Create projects and tasks
- [ ] Real-time task status updates
- [ ] Focus mode for single-task concentration

## Models
    - User (email, password)
    - Project (name, belongs_to user)
    - Task (title, description, status, belongs_to project, belongs_to user)