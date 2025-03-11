#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"
GUESS_COUNTER=1

# enter username
echo -e "\nEnter your username:"
read USERNAME
#echo $USERNAME

# check if username exists
#USER_INFO=$($PSQL "SELECT COUNT(game_id), MIN(guesses) FROM users WHERE username='$USERNAME';")
FIND_USER=$($PSQL "SELECT * FROM users WHERE username='$USERNAME';")

# if not, add to database
if [[ -z $FIND_USER ]]
  then
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
    #INSERT_USERNAME_RESULT=$($PSQL "INSERT INTO users(username) VALUES ('$USERNAME');")
  else
    # if user exists, print welcome message
    USER_INFO=$($PSQL "SELECT COUNT(game_id), MIN(guesses) FROM users WHERE username='$USERNAME';")
    
    echo $USER_INFO | while read NUM_GAMES BAR BEST_GAME
    do
      echo -e "\nWelcome back, $USERNAME! You have played $NUM_GAMES games, and your best game took $BEST_GAME guesses."
    done
fi

GET_GUESS() {
if [[ $1 ]]
  then
    echo -e "\n$1"
  else
    echo -e "\nGuess the secret number between 1 and 1000:"
  fi
  read GUESS
}

# generate random number
NUM=$((1 + $RANDOM % 1000))
#NUM=10

# get user guess
#echo -e "\nGuess the secret number between 1 and 1000:"
#read GUESS
GET_GUESS

if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    # send to main menu
    GET_GUESS "That is not an integer, guess again:"
fi

while [[ $GUESS != $NUM ]]
do
# increment guess counter by 1
GUESS_COUNTER=$((GUESS_COUNTER + 1))
# if guess is lower than num, print hint and get new guess
if [[ $GUESS -lt $NUM ]]
  then
    ##echo -e "\nIt's higher than that, guess again:"
    #read GUESS
    GET_GUESS "It's higher than that, guess again:"
  # if guess is higher than num, print hint and get new guess
  elif [[ $GUESS -gt $num ]]
    then
      #echo -e "\nIt's lower than that, guess again:"
      #read GUESS
      GET_GUESS "It's lower than that, guess again:"
  #else
  # if guess equals num, print congratulations message and number of guesses
  #echo "You guessed it in $GUESS_COUNTER tries. The secret number was $NUM. Nice job!"
fi
done
  # push game info to database
  INSERT_GAME_RESULT=$($PSQL "INSERT INTO users(username, guesses) VALUES ('$USERNAME', $GUESS_COUNTER);")

  echo "You guessed it in $GUESS_COUNTER tries. The secret number was $NUM. Nice job!"






