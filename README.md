This project has been created as part of the 42 curriculum by dmazari

## Description

This project was created to understand containerization using Docker.

Docker allows applications to be deployed in a consistent and reproducible environment by packaging all dependencies inside containers. This approach solves many deployment issues related to environment differences.

In this project, we deploy three services:
- MariaDB as the database
- WordPress as the CMS (Community manager sexy)
- Nginx as the web server

Once the project is running, the WordPress website can be accessed through the SITE_URL defined in the `.env` file.

Key comparisons:
• Virtual Machines vs Docker: a VM is a complete OS, it's heavy, take time to start it, but it's isolated. Instead the docker use the host kernel, so it's lighter, it's faster to run it and very useful for microservices !
• Secrets vs Environment Variables: We use a .env file with environment variables for configuration.
• Docker Network vs Host Network: The docker network create a network between the containers, we don't have to manage them, it's isolate from the Host Network and it's more safe. The Host Network we will have to manage all the ports.
• Docker Volumes vs Bind Mounts: Bind Mounts will be dependant of the OS and it's not portable ! With docker Volumes, it's fully handle by docker, it's persistent, safe and portable.

## Instruction:
First of all, you need to create a .env (do not share your .env file) file needed to deploy the services. In this one you need to fill in these variables :

	```
	MYSQL_DATABASE=
	MYSQL_USER=
	MYSQL_PASSWORD=
	SITE_URL=
	ADMIN_USER=
	ADMIN_PASSWORD=
	ADMIN_EMAIL=
	WP_USER=
	WP_USER_EMAIL=
	WP_USER_PASSWORD=
	```

When this is done, you can start to build the containers and run the services.
Here are the command line you can use at the root of the project:

- "make build" : build the containers.
- "make up" : start the services.
- "make" : make build + make up.
- "make clean" : stop the services.
- "make fclean" : stop the services and delete the volumes of mariadb and wordpress.
- "make re" : make fclean + make.
- "make logs" : display the logs of the services.
- "make sprune" : to use if you want to delete all containers, volumes, images and networks (including those from other projects)!
- "make pre" : make sprune + make


## Resources:

- https://docs.docker.com/
- https://developer.wordpress.org/cli/commands/
- https://nginx.org/en/docs/
- https://www.hostinger.com/fr/tutoriels/wp-cli#Comment_installer_WP-CLI

AI was used to determine whether Debian or Alpine is better for building Docker images.
As well as to explain the commands in the Dockerfile and its structure.
I used AI for the CLI command needed to set wordpress, for the nginx config file ! Also for the README.md and the docs.