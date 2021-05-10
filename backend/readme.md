# Build docker image

1. Pull docker repository
   docker pull mongo
2. Create directory to mapping from local to container
   mkdir -d mongodb
3. Run docker container
   docker run -it -v mongo_db:/data/db -p 27017:27017 --name mongodb -d mongo
4. Check docker container
   docker ps
5. You can also check logs
   docker logs mongodb
6. Interact with mongo
   docker exec -it mongodb bash
