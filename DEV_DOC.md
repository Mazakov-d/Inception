## Set up

Make sure docker and make are installed.
Here is the command to install docker on Ubuntu :
`sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin`


You need a config file for the server service, here nginx. You can take the default config of nginx and update it! Create a server on it, listening to port 443, and use SSL protocols TLSv1.2 or TLSv1.3. Create two locations on this server:
- location / {
			try_files $uri $uri/ /index.php?$args;
		}
- location ~ \.php$ {
				fastcgi_pass wordpress:9000;
				fastcgi_index index.php;
				include fastcgi_params;
				fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
				fastcgi_param PATH_INFO $fastcgi_path_info;
		}
Here you got your config file for nginx ! For debug you can redirect the log to /dev/stdout or /dev/stderr to access them through the log of your container.

Next you have to create a .env file in the secrets directory at the root of the project on this you have to fill these variables : 
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

## Build

To build the project from the root, run `make`. This command creates the data directories for volumes and builds the Docker Compose in the srcs directory, then starts the containers. See README.md for all available Makefile commands.

## Managing Containers and Volumes

From the srcs directory, here are useful commands:
- `docker compose ps` : see all running containers and their status
- `docker compose exec {service} bash` : access a container's terminal
- `docker compose logs {service}` : see logs from a specific service (nginx, wordpress, mariadb)
- `docker compose down` : stop all containers
- `docker compose restart {service}` : restart a service
- `docker volume ls` : list all volumes


## Data Storage and Persistence

The project uses two volumes with bind mounts to store data on your machine:
- wp_data : stores WordPress files and configuration. Located at `/home/dmazari/data/wordpress`
- db_data : stores MariaDB database files. Located at `/home/dmazari/data/mariadb`

When you run `make fclean`, these directories and their data are deleted. If you run `make clean`, containers stop but the data directories stay and keep your data safe. If you just restart containers, the data persists because the directories aren't deleted.

You can access your data directly on your machine by looking in those directories!
