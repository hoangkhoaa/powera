# Build docker image

1. Pull docker repository

   ```bash
   docker pull mongo
   ```

2. Create directory to mapping from local to container
   ```bash
   mkdir -d mongodb
   ```
3. Run docker container
   ```bash
   docker run -it -v mongo_db:/data/db -p 27017:27017 --name mongodb -d mongo
   ```
4. Check docker container
   ```bash
   docker ps
   ```
5. You can also check logs
   ```bash
   docker logs mongodb
   ```
6. Interact with mongo
   ```bash
   docker exec -it mongodb bash
   ```

# Set up virtualenv

_Stand in root directory_

    source env/bin/activate
    pip install -r requirements.txt
