#!/bin/bash
# Does a full cross build of all scala/akka versions.

DEFAULT_COMMAND=publish-signed

CMD=${1:-$DEFAULT_COMMAND}

VERSION="$(grep baseVersion build.sbt | head -n 1 | grep -o '".*"' | sed 's/"//g' | tr '[a-z]' '[A-Z]')"
echo "Version: $VERSION"

if [ $CMD == $DEFAULT_COMMAND ]; then
  if [[ $VERSION == *SNAPSHOT* ]]; then
    echo "Don't publish SNAPSHOTS!"
    exit 1
  fi
  echo 'Did you tag already?'
  sleep 1
fi

sbt '; set akkaVersion := "";       set crossScalaVersions := Seq("2.11.11", "2.12.2")' +$CMD \
    '; set akkaVersion := "2.3.16"; set crossScalaVersions := Seq("2.11.11")' +$CMD \
    '; set akkaVersion := "2.4.20"; set crossScalaVersions := Seq("2.12.4")' +$CMD
#    '; set akkaVersion := "2.5.8"; set crossScalaVersions := Seq("2.12.4")' +$CMD