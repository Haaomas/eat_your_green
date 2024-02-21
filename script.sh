#!/bin/bash

# Description Create a script start by a cron who will randomly push stuff on this repo to make my github look good

# * Pseudo code

cd ~/Documents/Dev/eat_your_green

# TODO Create a script that will randomly get a jobs via api ??

# TODO Make a for loop to push between 0 to 5 jokes
for ((i=0; i<5; i++))
do
    # TODO Add jokes to a file
    curl -X GET \
    'https://geek-jokes.sameerkumar.website/api?format=json' >> tism.txt
    # TODO Make a git add
    git add .

    # TODO Make a git commit with a random message using this api : https://whatthecommit.com/index.txt
    commit_message=$(curl -s https://whatthecommit.com/index.txt)
    git commit -m "$commit_message"

    # TODO Make a git push
    git push
done


# TODO Create a cron job that will run the script every 48 hours
# Add the following line to your crontab file (run "crontab -e" to edit):
# 0 0 */2 * * /bin/bash /home/barreauj/Documents/Dev/eat_your_green/script.sh
