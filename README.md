# Project Management App

The project management app is a server-side API built using Ruby's Sinatra DSL The API follows the MVC design pattern, and it provides a backend for a React-based frontend. The API supports all CRUD operations, including POST, DELETE, and PATCH, as well as authentication for secure user access.


## Front-end Project Task Management Interface

You can use this API in conjunction with my front-end project management app [see the repo](https://github.com/Khadaryussuf/project-management-app-frontend)

## Technologies Used in API

- Ruby
- ActiveRecord
- SQLite3
- Rack

## How To Use

Install it and run:

```sh
bundle install

# create migrations with activerecord
rake db:migrate

# start server
bundle exec shotgun
```

Shotgun uses port 9393 by default.

## Relationships within Database

### Projects

- has many boards
- has many tasks through boards

### Boards

- belongs to a project
- has many tasks

### Tasks

- belongs to a board
- belongs to project though a board

## Example Calls You Can Make With API

### Projects

You can make all CRUD calls for the projects database.

- CREATE projects
- GET/RETRIEVE all projects
- GET/RETRIEVE individual project
- DELETE a project
- UPDATE a project

#### Example: Retrieve All Projects

Shows you projects and all of the tasks associated with the project

```js

fetch('http://localhost:9393/projects')
      .then((res) => res.json())
      .then((data) => data.projects)


// output
{
message: "projects successfully requested",
projects: [
{
id: 1,
title: "Client 1",
created_at: "2021-09-28T23:50:45.619Z",
updated_at: "2021-10-02T14:23:11.091Z",
favorite: true,
color: "#b2ebf2",
tasks: [
{
id: 8,
name: "Banner - Banner - DD994 - 25 Dollars Off 100 FSH 100",
due_date: "2021-09-29",
description: "promo code only\nBanner - Banner - DD994 - 25 Dollars Off 100 FSH 100\nGlobal Disclaimer - Banner - DD994 - 25 Dollars Off 100 FSH 100\nHomepage - Banner - DD994 - 25 Dollars Off 100 FSH 100",
status: "Complete",
priority: "High",
completed: true,
board_id: 2,
created_at: "2021-09-28T23:50:45.679Z",
updated_at: "2021-09-28T23:50:45.679Z"
},
{
id: 9,
name: "Banner - DND139 - 25 Off 100 FSH 100",
due_date: "2021-09-29",
description: "promo code only\nGlobal Banner - Banner - DND139 - 25 Off 100 FSH 100\nGlobal Disclaimer - Banner - DND139 - 25 Off 100 FSH 100\nHomepage - Banner - DND139 - 25 Off 100 FSH 100",
status: "In Progress",
priority: "High",
completed: false,
board_id: 2,
created_at: "2021-09-28T23:50:45.680Z",
updated_at: "2021-09-28T23:50:45.680Z"
},
{
id: 10,
name: "Promo Code TEST",
due_date: "2021-09-30",
description: "Global Banner - Banner - TEST - In Monetate\nGlobal Disclaimer - Banner - DND142 - 25 Dollars Off 100 FSH 100\nGlobal Disclaimer - Banner - DND141 - 25 Off 100 FSH 100\nGlobal Banner - Banner - TEST - In Monetate",
status: "In Progress",
priority: "High",
completed: false,
board_id: 2,
created_at: "2021-09-28T23:50:45.680Z",
updated_at: "2021-09-28T23:50:45.680Z"
},
{
id: 11,
name: "Workspace for Test",
due_date: "2021-09-30",
description: "",
status: "Not Started",
priority: "Low",
completed: false,
board_id: 2,
created_at: "2021-09-28T23:50:45.680Z",
updated_at: "2021-09-28T23:50:45.680Z"
}
]
},
}
```

#### Example: Retrieve a Specific Project

Shows you all boards and tasks associated with the project

```js
fetch('http://localhost:9393/projects/1')
      .then((res) => res.json())
      .then((data) => data.projects)


// output
{
message: "project successfully requested",
project: {
id: 1,
title: "Client 1",
created_at: "2021-09-28T23:50:45.619Z",
updated_at: "2021-10-02T14:23:11.091Z",
favorite: true,
color: "#b2ebf2",
boards: [
{
id: 1,
name: "Backlog",
created_at: "2021-09-28T23:50:45.645Z",
updated_at: "2021-09-28T23:50:45.645Z",
project_id: 1,
tasks: [ ]
},
{
id: 2,
name: "To Do",
created_at: "2021-09-28T23:50:45.646Z",
updated_at: "2021-09-28T23:50:45.646Z",
project_id: 1,
tasks: [
{
id: 8,
name: "Banner - Banner - DD994 - 25 Dollars Off 100 FSH 100",
due_date: "2021-09-29",
description: "promo code only\nBanner - Banner - DD994 - 25 Dollars Off 100 FSH 100\nGlobal Disclaimer - Banner - DD994 - 25 Dollars Off 100 FSH 100\nHomepage - Banner - DD994 - 25 Dollars Off 100 FSH 100",
status: "Complete",
priority: "High",
completed: true,
board_id: 2,
created_at: "2021-09-28T23:50:45.679Z",
updated_at: "2021-09-28T23:50:45.679Z"
},
{
id: 9,
name: "Banner - DND139 - 25 Off 100 FSH 100",
due_date: "2021-09-29",
description: "promo code only\nGlobal Banner - Banner - DND139 - 25 Off 100 FSH 100\nGlobal Disclaimer - Banner - DND139 - 25 Off 100 FSH 100\nHomepage - Banner - DND139 - 25 Off 100 FSH 100",
status: "In Progress",
priority: "High",
completed: false,
board_id: 2,
created_at: "2021-09-28T23:50:45.680Z",
updated_at: "2021-09-28T23:50:45.680Z"
},
{
id: 10,
name: "Promo Code TEST",
due_date: "2021-09-30",
description: "Global Banner - Banner - TEST - In Monetate\nGlobal Disclaimer - Banner - DND142 - 25 Dollars Off 100 FSH 100\nGlobal Disclaimer - Banner - DND141 - 25 Off 100 FSH 100\nGlobal Banner - Banner - TEST - In Monetate",
status: "In Progress",
priority: "High",
completed: false,
board_id: 2,
created_at: "2021-09-28T23:50:45.680Z",
updated_at: "2021-09-28T23:50:45.680Z"
},
{
id: 11,
name: "Workspace for Test",
due_date: "2021-09-30",
description: "",
status: "Not Started",
priority: "Low",
completed: false,
board_id: 2,
created_at: "2021-09-28T23:50:45.680Z",
updated_at: "2021-09-28T23:50:45.680Z"
}
]
},
{
id: 3,
name: "Completed",
created_at: "2021-09-28T23:50:45.646Z",
updated_at: "2021-09-28T23:50:45.646Z",
project_id: 1,
tasks: [ ]
}
]
}
}
```

### Boards

You can make all CRUD calls for the projects database.

- CREATE boards
- GET/RETRIEVE all boards
- DELETE a board
- UPDATE a board

### Example: Create a Board

```js
fetch('http://localhost:9393/boards/', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        accept: 'application/json',
      },
      body: JSON.stringify({
        name: 'New Board',
        project_id: 1, #mandatory to make a new board
      }),
    })

// output
{
    "message": "board successfully created",
    "board": {
        "id": 10,
        "name": "New Board",
        "created_at": "2021-10-02T15:11:11.647Z",
        "updated_at": "2021-10-02T15:11:11.647Z",
        "project_id": 1
    }
}
```

### Tasks

You can make all CRUD calls for the projects database.

- CREATE tasks
- GET/RETRIEVE all tasks
- DELETE a task
- UPDATE a task

### Example: Delete a Task

```js
fetch(`http://localhost:9393/tasks/11`, {
      method: 'DELETE',
    })

// output
{
    "message": "task successfully deleted",
    "task": {
        "id": 11,
        "name": "Workspace for Test",
        "due_date": "2021-09-30",
        "description": "",
        "status": "Not Started",
        "priority": "Low",
        "completed": false,
        "board_id": 2,
        "created_at": "2021-09-28T23:50:45.680Z",
        "updated_at": "2021-09-28T23:50:45.680Z"
    }
}
```
## Author

Mohamed khadar Yussuf

## License

This application is licensed under MIT License