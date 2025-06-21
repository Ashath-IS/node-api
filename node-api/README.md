# 👥 Node.js User API with MySQL

A mock user listing API built using **Node.js**, **Express**, and **MySQL**, mimicking the output of [dummyjson.com/users](https://dummyjson.com/users).

---

## 📦 Features

- RESTful endpoint: `GET /users`
- MySQL database integration
- Safe SQL handling using `mysql2/promise`
- Uses environment variables for sensitive config
- Structured codebase with routing and DB layer

---

## 🚀 Getting Started

### 1. Clone the project

```bash
 - Clone the project and move to the required directory
 - Install the required packages
 - Create a new MySQL database and user
 - Update the `.env` file with your database credentials

 ```

### 2. Create a new MySQL database and user if not exist

```bash
  - mv script.sh ~/
  - cd ~
  - chmod +x script.sh
  -sudo ./script.sh

```

### 3. Run project

    - Run the project using the following command
    - npm run dev
    - Access the API at http://localhost:3000/users for the list of users from dummyjson api
    - Access the API at http://localhost:3000/fromDb for the list of users from mysql server

---
