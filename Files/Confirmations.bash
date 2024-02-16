#!/usr/bin/env bash

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
    consent=true
  else
    consent=false
  fi
}


Options()
{
  echo "The Following options listed Below Are Optional but are not required to function"
  echo "Please visit https://github.com/EngineFw/EngineShell for more information"
  echo "1: Create Additional Params with ACL Advanced Control List"
  echo "2 Create an Additional Group for"
  read Options

}