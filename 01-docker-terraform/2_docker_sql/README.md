# Project Title

A brief description of what this project does and who it's for.

## Usage Instructions

This project is orchestrated with Docker Compose, which simplifies the setup and running of multi-container Docker applications. To get started, you need to configure environment variables and then launch the services.

### Environment Configuration

Create a `.env` file in the root directory of the project. This file should contain the necessary environment variables for the services to run properly.

Here's the list of environment variables you need to set in your `.env` file:

- `POSTGRES_PORT`: The port on which PostgreSQL will run (e.g., `5432`).
- `POSTGRES_USER`: The default username for PostgreSQL (e.g., `user`).
- `POSTGRES_PASSWORD`: The password for the PostgreSQL user (e.g., `password`).
- `POSTGRES_DB`: The default database name (e.g., `mydatabase`).
- `PGADMIN_DEFAULT_EMAIL`: The default email for PgAdmin (e.g., `admin@example.com`).
- `PGADMIN_DEFAULT_PASSWORD`: The password for PgAdmin (e.g., `admin`).


Here's an example of what your `.env` file should look like:
```
POSTGRES_PORT=5432
POSTGRES_USER=user
POSTGRES_PASSWORD=password
POSTGRES_DB=mydatabase
PGADMIN_DEFAULT_EMAIL=admin@example.com
PGADMIN_DEFAULT_PASSWORD=admin
```


### Running the Application

With Docker and Docker Compose installed on your system and after setting up the `.env` file, you can start the application using the following command:

```bash
docker-compose up -d
```

This command will start all the services defined in your docker-compose.yml file in detached mode. The services include your Postgres database, PgAdmin, Node.js backend, and React frontend.

To view the logs of your services, you can use:


```bash
docker-compose logs -f
```

To stop and remove all the running services, you can use:
```bash
docker-compose down
```
### Additional Information
- Make sure Docker and Docker Compose are installed on your system.
- Ensure the ports defined in docker-compose.yml are free or adjust them if necessary.