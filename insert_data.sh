#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $WINNER != 'winner' ]]
  then
    # check if team is already in table
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER';")
    # if not found
    if [[ -z $TEAM_ID ]]
    then
      # insert major
      INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams (name) VALUES ('$WINNER')")
      if [[ $INSERT_TEAM_RESULT == 'INSERT 0 1' ]]
      then
        echo Inserted into teams, $WINNER
      fi
    # get new major_id
    #WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER';")
    fi
  fi

  if [[ $OPPONENT != 'opponent' ]]
  then
    # check if team is already in table
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT';")
    # if not found
    if [[ -z $TEAM_ID ]]
    then
    # insert major
    INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams (name) VALUES ('$OPPONENT')")
      if [[ $INSERT_TEAM_RESULT == 'INSERT 0 1' ]]
      then
        echo Inserted into teams, $OPPONENT
      fi
    # get new major_id
    #OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT';")
    fi
  fi
done

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != 'year' ]]
  then
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER';")
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT';")


    INSERT_YEAR_RESULT=$($PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS);")
    if [[ $INSERT_YEAR_RESULT == 'INSERT 0 1' ]]
    then 
      echo Inserted into games, $YEAR, $ROUND, $WINNER, $OPPONENT, $WINNER_GOALS, $OPPONENT_GOALS
    fi
  fi

 : ' if [[ $ROUND != 'round' ]]
  then
    INSERT_ROUND_RESULT=$($PSQL "INSERT INTO games (round) VALUES ('$ROUND');")
    if [[ $INSERT_ROUND_RESULT == 'INSERT 0 1' ]]
    then
      echo Inserted into games, $ROUND
    fi
  fi

  if [[ $WINNER != 'winner' ]]
  then
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$WINNER';")
    INSERT_WINNER_ID_RESULT=$($PSQL "INSERT INTO games (winner_id) VALUES ($WINNER_ID);")
    if [[ $INSERT_WINNER_ID_RESULT == 'INSERT 0 1' ]]
    then
      echo Inserted into games, $WINNER_ID
    fi
  fi

  if [[ $OPPONENT != 'opponent' ]]
  then
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT';")
    INSERT_OPPONENT_ID_RESULT=$($PSQL "INSERT INTO games (opponent_id) VALUES ($OPPONENT_ID);")
    if [[ $INSERT_OPPONENT_ID_RESULT == 'INSERT 0 1' ]]
    then
      echo Inserted into games, $OPPONENT_ID
    fi
  fi

  if [[ $WINNER_GOALS != 'winner_goals' ]]
  then
    INSERT_WINNER_GOALS_RESULT=$($PSQL "INSERT INTO games (winner_goals) VALUES ($WINNER_GOALS);")
    if [[ $INSERT_WINNER_GOALS_RESULT == 'INSERT 0 1' ]]
    then
      echo Inserted into games, $WINNER_GOALS
    fi
  fi

  if [[ $OPPONENT_GOALS != 'opponent_goals' ]]
  then
    INSERT_OPPONENT_GOALS_RESULT=$($PSQL "INSERT INTO games (opponent_goals) VALUES ($OPPONENT_GOALS);")
    if [[ $INSERT_OPPONENT_GOALS_RESULT == 'INSERT 0 1' ]]
    then
      echo Inserted into games, $OPPONENT_GOALS
    fi
  fi '

done

: 'cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $OPPONENT != 'opponent' ]]
  then
    # check if team is already in table
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT';")
    # if not found
    if [[ -z $TEAM_ID ]]
    then
    # insert major
    INSERT_TEAM_RESULT=$($PSQL "INSERT INTO teams (name) VALUES ('$OPPONENT')")
      if [[ $INSERT_TEAM_RESULT == 'INSERT 0 1' ]]
      then
        echo Inserted into teams, $OPPONENT
      fi
    # get new major_id
    TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name = '$OPPONENT';")
    fi
  fi
done '
  


