#!/usr/bin/env bash

lsyncd -nodaemon -rsyncssh /data $DESTINATION_HOST $DESTINATION_DIR
