#!/bin/bash

#Provjera jesu li zadani direktoriji kao parametri
if [ "$#" -ne 2 ]
then
    echo "Nisu zadani direktoriji kao parametar!"
    exit 1
fi

# Provjera postoji li zadani direktorij
if [ ! -d "$1" ]
then
  echo "Direktorij $1 ne postoji"
  exit 1
fi

# Provjera postoj li zadani direktorij
if [ ! -d "$2" ]
then
  echo "Direktoriji $2 ne postoji"
  exit 1
fi

#Sinkronizacija dir1 -> dir2
#echo "$1 --> $2"
for f in "$1"/*
do
  if [ -f "$f" ] && [ "$f" -nt "$2/$(basename $f)" ]
  then
    echo "$f --> $2"
  fi
done

#Sinkronizacija dir2 -> dir1
#echo "$2 --> $1"
for f in "$2"/*
do
  if [ -f "$f" ] && [ "$f" -nt "$1/$(basename $f)" ]
  then
    echo "$f --> $1"
  fi
done