FROM mysql:8.0.40

      ENV MYSQL_ROOT_PASSWORD=rootpassword
      ENV MYSQL_DATABASE=mydatabase
      ENV MYSQL_USER=myapp
      ENV MYSQL_PASSWORD=password

      COPY init.sql /docker-entrypoint-initdb.d/