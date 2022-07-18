#!/bin/bash

cd /app/realworld
source conduit/bin/activate
manage.py runserver 0.0.0.0:8000 &
echo "Server is started"
