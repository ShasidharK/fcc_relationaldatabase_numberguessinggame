#!/bin/bash

DB="number_guess"

# Prompt username
echo "Enter your username:"
read USERNAME

# Trim username
USERNAME=${USERNAME:0:22}

# Fetch user ID
USER_ID=$(psql --username=freecodecamp --dbname=$DB --tuples-only --no-align -c \
"SELECT user_id FROM users WHERE username='$USERNAME';")

# If user doesn't exist
if [[ -z $USER_ID ]]; then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  psql --username=freecodecamp --dbname=$DB --quiet -c \
  "INSERT INTO users(username) VALUES('$USERNAME');" > /dev/null
  USER_ID=$(psql --username=freecodecamp --dbname=$DB --tuples-only --no-align -c \
  "SELECT user_id FROM users WHERE username='$USERNAME';")
else
  GAMES_PLAYED=$(psql --username=freecodecamp --dbname=$DB --tuples-only --no-align -c \
  "SELECT COUNT(*) FROM games WHERE user_id=$USER_ID;")
  BEST_GAME=$(psql --username=freecodecamp --dbname=$DB --tuples-only --no-align -c \
  "SELECT MIN(guesses) FROM games WHERE user_id=$USER_ID;")

  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Generate secret number
SECRET=$((1 + RANDOM % 1000))
echo "Guess the secret number between 1 and 1000:"

GUESSES=0
while true; do
  read GUESS
  if ! [[ "$GUESS" =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi

  ((GUESSES++))

  if [[ "$GUESS" -lt "$SECRET" ]]; then
    echo "It's higher than that, guess again:"
  elif [[ "$GUESS" -gt "$SECRET" ]]; then
    echo "It's lower than that, guess again:"
  else
    echo "You guessed it in $GUESSES tries. The secret number was $SECRET. Nice job!"
    break
  fi
done

# Save game
psql --username=freecodecamp --dbname=$DB --quiet -c \
"INSERT INTO games(user_id, guesses) VALUES($USER_ID, $GUESSES);" > /dev/null
