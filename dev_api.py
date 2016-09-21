import sys
import os
import json
from flask import Flask, jsonify
from flask_cors import CORS
from atomicapp.nulecule.base import Nulecule
from atomicapp.nulecule.config import Config

NULECULE_REPO = '/home/ernelson/cap/nulecule-library'

def get_answers(nulecule_path):
    nulecule = Nulecule.load_from_path(nulecule_path)
    nulecule.config = Config()
    nulecule.load_config(skip_asking=True)
    return nulecule.config.runtime_answers()

def get_nulecule_list():
    return [name for name in os.listdir(NULECULE_REPO)
        if os.path.isdir(os.path.join(NULECULE_REPO, name))]

app = Flask(__name__)
CORS(app)

@app.route('/nulecules')
def nulecule_list():
    return jsonify({
        'nulecules': get_nulecule_list()
    })

@app.route('/nulecules/<nulecule_id>')
def nulecule_detail(nulecule_id):
    nulecule_path = os.path.join(NULECULE_REPO, nulecule_id)
    return jsonify({
        'nulecule': get_answers(nulecule_path)
    })
