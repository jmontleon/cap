# CAP Project

## Vagrant

A Vagrant virtual environment is provided based on the Red Hat Container Development Kit

 - Overivew:
    - https://developers.redhat.com/products/cdk/overview/
 - CDK Installation Guide:    
  - https://access.redhat.com/documentation/en/red-hat-container-development-kit/2.2/paged/installation-guide/
 - RHEL Blog Post talking about CDK from 2/2016
  - http://rhelblog.redhat.com/2016/02/25/getting-started-with-the-red-hat-container-development-kit-cdk/



### Vagrant Usage

 1. Download and install the vagrant base box, must be installed as 'cdkv2' as per CDK instructions.
  - Download base box from https://access.redhat.com/downloads/content/293/
  - Add box, example for virtualbox:
     - $ vagrant box add --name cdkv2 ~/Downloads/rhel-cdk-kubernetes-7.2.x86_64.vagrant-virtualbox.box*

 1. ```vagrant plugin install vagrant-service-manager vagrant-registration vagrant-sshfs landrush```
 1. Define environment variables for subscription-manager
  - export SUB_USERNAME=name
  - export SUB_PASSWORD=password
 1. vagrant up
 1. vagrant ssh
  - cd /vagrant
  - ./start_dev_api.sh
 1. vagrant ssh (another terminal)
  - cd /vagrant
  - npm start
 1. visit: http://cap.example.com:3000


### Dependencies

python 2.7.12 and pip

node & npm (tested in 6.5.0)

working (and running) docker install where the $USER belongs to the docker group
so we won't end up with permissioning issues.

### Servers

Project uses 2 servers, one that's scrictly a dev api server for exposing
nulecule data to the client. The second is the react dev server. It's a simple
node server with some niceties for building and serving the react application
and auto reloading react components, in browser errors etc.

These are two distinct servers running on two separate ports.
3000 for the react app and 3001 for the api server.

To get started, install the dependencies with `install_dependencies.sh` script.

Start dev_api with `./start_dev_api.sh`, should launch on `127.0.0.1:3001`

Test to make sure it's working: `curl http://localhost:3001/nulecules`

New terminal, start up the react dev server, it will take a bit to build the application
initially, and each time a react change is made, the server will rebuild
and load into the browser without requiring page refreshes.

`npm start`

Visit `http://localhost:3000`, which should list the available nulecules
in the checked in dummy nulecule repo.

## Extra Reading Information

 - Test Driving OpenShift with the Red Hat Container Development Kit (CDK)
  - http://rhelblog.redhat.com/2016/03/07/test-driving-openshift-with-the-red-hat-container-development-kit-cdk/
