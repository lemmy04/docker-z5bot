# docker-z5bot
Running z5bot in a container


1. create a telegram bot by talking to the botfather

2. edit config.json.sample to contain your telegram bot API key, and the games you have

3. place config.json and your story files in a folder

4. create another folder for savegames

5. run the container:
   - mount the savegames folder to /home/z5bot/z5bot/saves
   - mount the folder with your story files that match what is in your config file into /home/z5bot/z5bot/stories

for example: 

docker run -d --rm \
           -v /users/lemmy/Work/Docker/docker-z5bot/saves:/home/z5bot/z5bot/saves \
           -v /users/lemmy/Work/Docker/docker-z5bot/stories:/home/z5bot/z5bot/stories \
              lemmy04/z5bot:0.0.4


