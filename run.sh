#!/usr/bin/env bash

lsyncd -nodaemon -rsyncssh $SOURCE_DIRECTORY $DESTINATION_HOST $DESTINATION_DIR
