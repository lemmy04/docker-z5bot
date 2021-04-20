# docker-z5bot
Running z5bot in a container


1. create a telegram bot by talking to the botfather
2. edit config.json.sample to contain your bot key, and the games you have
3. run the container:
   - mount the config file you created to /home/z5bot/z5bot/config.json inside the container
   - mount the folder with your story files that match what is in your config file into /home/z5bot&z5bot/stories

for example: 

docker run -d \
           -v /users/lemmy/Work/Docker/docker-z5bot/config.json:/home/z5bot/z5bot/config.json \
           -v /users/lemmy/Work/Docker/docker-z5bot/stories:/home/z5bot/z5bot/stories \
              lemmy04/z5bot:0.0.1


