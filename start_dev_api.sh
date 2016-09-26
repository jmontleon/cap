#!/bin/bash
project_root="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PYTHONPATH=$PYTHONPATH:$project_root/pylib FLASK_APP=$project_root/dev_api.py flask run --host=0.0.0.0 --port=3001
