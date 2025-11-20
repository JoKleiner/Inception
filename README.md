# Inception - 42 Project
**About:**<br/>
Inception is a small infrastructure project to set up multiple services in Docker containers on a virtual machine.<br/>
The goal is to learn how to configure Docker Compose, write Dockerfiles, manage networks, volumes, and secure communication between services with TLS.<br/>
<br/>
**Compile:**

    make up

Your NGINX container will be the sole entry point on port 443 with TLSv1.2/1.3.<br/>
WordPress and MariaDB run in separate containers and communicate via a dedicated Docker network.<br/>

**What I Learned:**<br/>
Writing custom Dockerfiles for each service<br/>
Using Docker volumes for persistence (database and WordPress files)<br/>
Setting up a secure NGINX reverse proxy with TLS<br/>
Creating and managing a Docker network<br/>
Managing environment variables and Docker secrets for security<br/>
Ensuring containers restart automatically and follow best practices for daemons
