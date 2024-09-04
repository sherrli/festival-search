#!/bin/bash

# Git-bash testing
# jq reference - https://stackoverflow.com/questions/41566971/how-to-get-spotify-artist-id-for-the-spotify-endpoint-url

# Read artist from cmd line
# ARTIST=${1// /+}
# echo Telling you the genre for $ARTIST
TOKEN=""; # set env variable prior

# todo: computer vision to read poster into array
# artists=("Alan+Walker" "Alesso" "Alok" "ARMNHMR" "Audien" "Black+Tiger+Sex+Machine" "Boys+Noize" "Cheyenne+Giles" "Cirez+D" "Cristoph" "Dabin" "Elderbrook" "Endless+Summer" "Eric+Prydz" "Fisher" "Frank+Walker" "Green+Velvet" "Gryffin" "HI-LO" "HOL!" "ISOxo" "James+Hype" "Kaskade" "Kayzo" "KREAM" "Le+Youth" "Marsh" "Marshmello" "Martin+Garrix" "Max+Styler" "MitiS" "Oliver+Heldens" "Ray+Volpe" "Seven+Lions" "Shamier+Anderson" "SLANDER" "Steve+Aoki" "Subtronics" "Tita+Lau" "Vastive" "RZRKT" "Wax+Motif" "DEECEE" "DirtyHappy" "ELUSID" "Kevin+Faria" "Lukav" "Mark+Jones" "Paper+Skies" "R8YZ")\

# TODO wikipedia api
artists=("Alesso")
# TODO: REMOVE temp while 429 blocked
artist_genres=("dubstep" "bro step" "edm" "pop" "dubstep")
artist_genres_2=("edm" "pop" "dubstep")

# access token for 1 hr
for ARTIST in "${artists[@]}"
do
  echo -e "\nFinding genre for $ARTIST.."
  # API_ARTIST_URL=$(curl -s "https://api.spotify.com/v1/search?q=$ARTIST&type=artist&limit=1" --header "Authorization: Bearer $TOKEN")
  # echo $API_ARTIST_URL | jq '.artists.items[0].genres'

  # turn jq output into array
  # mapfile -t artist_genres < <(echo $API_ARTIST_URL | jq '.artists.items[0].genres')

  # for genre in "${artist_genres[@]}"
  #   do
  #     echo $genre
  #   done

  # artist_genres=`echo $API_ARTIST_URL | jq '.artists.items[0].genres'`
  # type $artist_genres

  # dictionary of genre:count
  declare -A artist_hashmap

  for genre in "${artist_genres[@]}"
    do
      if [ -z "${artist_hashmap["$genre"]+x}" ]; then
        echo "$genre does not exist, add it"
        artist_hashmap["$genre"]=1
      else
        echo "$genre exists, increment it"
        artist_hashmap["$genre"]=$((artist_hashmap["$genre"] + 1))
      fi
    done

  # print artist_hashmap
  for key in "${!artist_hashmap[@]}"; do
    echo "$key: ${artist_hashmap[$key]}"
  done
done
