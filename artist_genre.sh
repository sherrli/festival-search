#!/bin/bash

# Read artist from cmd line
# ARTIST=${1// /+}
# echo Telling you the genre for $ARTIST
TOKEN="$SPOTIFY_TOKEN"; # set env variable prior

# todo: computer vision to read poster into array
artists=("Alan+Walker" "Alesso" "Alok" "ARMNHMR" "Audien" "Black+Tiger+Sex+Machine" "Boys+Noize" "Cheyenne+Giles" "Cirez+D" "Cristoph" "Dabin" "Elderbrook" "Endless+Summer" "Eric+Prydz" "Fisher" "Frank+Walker" "Green+Velvet" "Gryffin" "HI-LO" "HOL!" "ISOxo" "James+Hype" "Kaskade" "Kayzo" "KREAM" "Le+Youth" "Marsh" "Marshmello" "Martin+Garrix" "Max+Styler" "MitiS" "Oliver+Heldens" "Ray+Volpe" "Seven+Lions" "Shamier+Anderson" "SLANDER" "Steve+Aoki" "Subtronics" "Tita+Lau" "Vastive" "RZRKT" "Wax+Motif" "DEECEE" "DirtyHappy" "ELUSID" "Kevin+Faria" "Lukav" "Mark+Jones" "Paper+Skies" "R8YZ")

# access token for 1 hr
for ARTIST in "${artists[@]}"
do
  echo -e "\nFinding genre for $ARTIST.."
  API_ARTIST_URL=$(curl -s "https://api.spotify.com/v1/search?q=$ARTIST&type=artist&limit=1" --header "Authorization: Bearer $TOKEN")
  echo $API_ARTIST_URL | jq -r '.artists.items[0].genres'
done
