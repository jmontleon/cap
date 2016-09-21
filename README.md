# CAP Project

### Prereqs

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
