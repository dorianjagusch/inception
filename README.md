# Inception Project 

## Introduction

The **Inception** project is part of the curriculum at **School 42** and focuses on learning the fundamentals of virtualization and containerization. The project is designed to give students hands-on experience with Docker, Docker Compose, and system architecture while guiding them through the process of setting up and managing a multi-container Docker environment for a web application.

## Learnings

- Understand and utilize **containerization** with Docker.
- Learn to use **Docker Compose** to orchestrate multi-container applications.
- Explore the concept of **Infrastructure as Code**.
- Gain familiarity with setting up services in a containerized environment.
- Understand basic networking between Docker containers.
- Basics of Nginx, Wordpress and Databases

## Mandatory Part

### Requirements

You will need to create a multi-container environment using Docker and Docker Compose that includes the following services:

1. **Nginx**: A web server that will act as a reverse proxy for the web application.
2. **WordPress**: A CMS (Content Management System) for building and managing websites.
3. **MariaDB**: A database service to store WordPress data.
5. **Volumes**: Persistent storage for your services to retain data between container restarts.
6. **Networking**: Configure Docker networks to ensure proper communication between services.

### Specifications

- Each service (Nginx, WordPress, MariaDB) must run in its own **Docker container**.
- You must create a **Docker Compose** file (`docker-compose.yml`) to define and configure the services.
- Containers must be configured to restart automatically if they crash.
- Data stored by MariaDB and WordPress should be stored on **volumes** to ensure persistence.
- The containers must be orchestrated and networked so that they communicate properly with each other.
- You must expose the necessary ports on Nginx and Wordpress to allow external access to the web application and database interface.

## How to Run the Project

### Prerequisites

- Install **Docker**: [Docker Installation Guide](https://docs.docker.com/get-docker/)
- Install **Docker Compose**: [Docker Compose Installation Guide](https://docs.docker.com/compose/install/)
- Make sure your system has enough resources (e.g., CPU, memory, and storage) to run the services simultaneously.

### Step-by-Step Instructions

1. **Clone the Repository**:  
   Clone the project repository to your local machine.
   ```bash
   git clone https://github.com/yourusername/inception.git
   cd inception/srcs
   ```

2. Configure Environment Variables:
Create a .env file or use the default values within the docker-compose.yml file. You may need to set database passwords, network configurations, or other environment-specific variables.
There is an example .env file in the root of this repository.

3.Build Docker Images:
Build the Docker images for each service by running:

```bash
docker-compose build
```
Start the Services:
Bring up all services by running:

```bash
docker-compose up -d
```

4. Access the Web Application:

Visit http://localhost:8080 in your web browser to access the WordPress site.
Visit http://localhost:8080/admin to access The admin page.

5. Manage Services:
You can stop the services with:
```bash
docker-compose down
```
