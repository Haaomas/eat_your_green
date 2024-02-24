#!/bin/bash
# Description Pushh random ggek jokes on github to make it look good


# Go to the directory
cd ~/Documents/Dev/eat_your_green

# Generate a random number between 0 and 3
random_number=$((RANDOM % 4 + 1))

# Loop through the random number
for ((i=1; i<$random_number; i++))
do
    # Add jokes to a file
    curl -X GET \
    'https://geek-jokes.sameerkumar.website/api?format=json' | jq -r '.joke' >> tism.txt

    # Add the file, create the random commit message and push it
    git add .
    commit_message=$(curl -s https://whatthecommit.com/index.txt)
    git commit -m "$commit_message"
    git push
done
