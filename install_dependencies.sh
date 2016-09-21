#!/bin/bash

# Install python dependencies from pip. Mainly the stuff atomicapp needs.
project_root="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pip install -r $project_root/pip_requirements.txt

# Install node dependencies for running the react build server and building
# the front end
npm install
