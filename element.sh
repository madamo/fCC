#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"
RE='[0-9]'
#PSQL="psql --username=freecodecamp --dbname=<database_name> -t --no-align -c"

if [[ -z $1 ]]
  then
    echo "Please provide an element as an argument."
  else
  if [[ $1 =~ [0-9] ]]
    then
      #echo "arg is a number"
      ELEMENT_INFO=$($PSQL "SELECT properties.atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, symbol, name, type FROM properties FULL JOIN
                            elements ON properties.atomic_number = elements.atomic_number INNER JOIN types ON properties.type_id = types.type_id WHERE properties.atomic_number=$1;")
    elif [[ $1 =~ [A-Z][a-z]?$ ]]
      then
      #echo "arg is symbol"
      ELEMENT_INFO=$($PSQL "SELECT properties.atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, symbol, name, type FROM properties FULL JOIN
                            elements ON properties.atomic_number = elements.atomic_number INNER JOIN types ON properties.type_id = types.type_id WHERE elements.symbol='$1';")
    else
      #echo "arg is name"
      ELEMENT_INFO=$($PSQL "SELECT properties.atomic_number, atomic_mass, melting_point_celsius, boiling_point_celsius, symbol, name, type FROM properties FULL JOIN
                            elements ON properties.atomic_number = elements.atomic_number INNER JOIN types ON properties.type_id = types.type_id WHERE elements.name='$1';")
    fi
      if [[ -z $ELEMENT_INFO ]]
        then
          echo "I could not find that element in the database."
        else
          echo $ELEMENT_INFO | while read ATOMIC_NUMBER BAR MASS BAR MELTING BAR BOILING BAR SYMBOL BAR NAME BAR TYPE
          do
            echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING celsius and a boiling point of $BOILING celsius."
          done
      fi
  
fi


#     echo "$AVAILABLE_BIKES" | while read BIKE_ID BAR TYPE BAR SIZE
#    do
#     echo "$BIKE_ID) $SIZE\" $TYPE Bike"
#   done


#re='^[0-9]+$'
#if ! [[ $yournumber =~ $re ]] ; then
 #  echo "error: Not a number" >&2; exit 1
#fi
