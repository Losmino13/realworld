#!/bin/bash

source conduit/bin/activate
manage.py runserver 0.0.0.0 &
echo "Server is started"