#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi


# Do not change code above this line. Use the PSQL variable above to query your database.
#there should be 24 rows, from the expected_output file

echo "$($PSQL  "insert into teams(name) values('France') " )" 
echo "$($PSQL  "insert into teams(name) values('Croatia') " )"
echo "$($PSQL  "insert into teams(name) values('Belgium') " )"
echo "$($PSQL  "insert into teams(name) values('England') " )"
echo "$($PSQL  "insert into teams(name) values('Russia') " )"
echo "$($PSQL  "insert into teams(name) values('Sweden') " )"
echo "$($PSQL  "insert into teams(name) values('Brazil') " )"
echo "$($PSQL  "insert into teams(name) values('Uruguay') " )"
echo "$($PSQL  "insert into teams(name) values('Colombia') " )"
echo "$($PSQL  "insert into teams(name) values('Switzerland') " )"
echo "$($PSQL  "insert into teams(name) values('Japan') " )"
echo "$($PSQL  "insert into teams(name) values('Mexico') " )"
echo "$($PSQL  "insert into teams(name) values('Denmark') " )"
echo "$($PSQL  "insert into teams(name) values('Spain') " )"
echo "$($PSQL  "insert into teams(name) values('Portugal') " )"
echo "$($PSQL  "insert into teams(name) values('Argentina') " )" #2018 cubierto
echo "$($PSQL  "insert into teams(name) values('Germany') " )"
echo "$($PSQL  "insert into teams(name) values('Netherlands') " )"
echo "$($PSQL  "insert into teams(name) values('Costa Rica') " )"
echo "$($PSQL  "insert into teams(name) values('Chile') " )"
echo "$($PSQL  "insert into teams(name) values('Nigeria') " )"
echo "$($PSQL  "insert into teams(name) values('Algeria') " )"
echo "$($PSQL  "insert into teams(name) values('Greece') " )"
echo "$($PSQL  "insert into teams(name) values('United States') " )"


cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do

  if [[  $YEAR != year  ]]
  then
    #Get winner_id
    WINNER_ID=$($PSQL "SELECT team_id from teams where name='$WINNER'  ") 

    #Get opponent_id
    OPPONENT_ID=$($PSQL "SELECT team_id from teams where name='$OPPONENT'  ") 

    #Insert the data
    INSERT_GAME_RESULT=$($PSQL "insert into games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) values($YEAR,'$ROUND',$WINNER_ID,$OPPONENT_ID,$WINNER_GOALS,$OPPONENT_GOALS)"  )

  fi
done

#cambiar $WINNER_ID y $OPPONENT_ID en lugar de lo que tengo ahorita