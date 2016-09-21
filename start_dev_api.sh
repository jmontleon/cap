#!/bin/bash
PYTHONPATH=$PYTHONPATH:./pylib FLASK_APP=./dev_api.py flask run --port=3001
