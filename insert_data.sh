#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
echo $($PSQL "TRUNCATE games, teams")
cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WGOALS OGOALS
do
  if [[ $YEAR != "year" ]]
  then
  #get winner team id from teams
  WINNERID=$($PSQL "select team_id from teams where name='$WINNER'")
    if [[ -z $WINNERID ]]
      then
      #add if not found
      INSERT_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      WINNERID=$($PSQL "select team_id from teams where name='$WINNER'")
      echo Inserted into teams: $WINNER
    fi
  #get opponent team id from teams
  OPPONENTID=$($PSQL "select team_id from teams where name='$OPPONENT'")
    if [[ -z $OPPONENTID ]]
      then 
      #add if not found
      INSERT_TEAM2=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      OPPONENTID=$($PSQL "select team_id from teams where name='$OPPONENT'")
      echo Inserted into teams: $OPPONENT
    fi
      
    # insert game
    INSERT_GAME=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES('$YEAR', '$ROUND', '$WINNERID', '$OPPONENTID', '$WGOALS', '$OGOALS')")
    echo Inserted into games: $WINNER $WGOALS - $OPPONENT $OGOALS
  fi
done
