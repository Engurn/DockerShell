#!/usr/bin/env bash
source ./Config.bash

function Agreement()
{
  echo "BY Using the Following script you Accept the following:"
  echo "1: You Have Root Access or Root Access privileges, All Actions will be logged"
  echo "2: You Accept Full responsibility when Installing this package"
  echo "3: Before Installing this package Please make sure you got it from https://github.com/EngineFw/DockerShell"
  echo "As this is the only Source we have uploaded this script to Please see our trusted Sources for more information"
  echo "-- Please type I Consent  and press enter to continue"
  read answer

  if [ "$answer" = "I Consent" ]; then
    echo "We Can Continue";
  else
    echo "Invalid Response: Please Make sure you have wrote it is written (Case Sensitive)"
    exit 0
  fi
}


Options()
{
  echo "Please CHoose one of the following options in order to continue"
  
}