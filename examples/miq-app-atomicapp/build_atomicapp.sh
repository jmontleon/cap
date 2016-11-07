pushd .
cd ~/nulecule-library

sudo docker build -t miq-memcached-atomicapp miq-memcached-atomicapp
sudo docker build -t miq-postgresql-atomicapp miq-postgresql-atomicapp
sudo docker build -t miq-app-atomicapp miq-app-atomicapp

popd







