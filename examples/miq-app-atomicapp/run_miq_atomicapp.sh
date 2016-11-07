pushd .

NULECULE_LIBRARY_HOME="/home/vagrant/nulecule-library"
DESTINATION="/tmp/miq-app-atomicapp"

oc login -u admin -p admin
oadm policy add-scc-to-user privileged system:serviceaccount:miq:default

oc login -u openshift-dev -p devel
oc new-project miq
mkdir -p ${DESTINATION}
atomicapp run miq-app-atomicapp --mode fetch --destination ${DESTINATION}
cp answers.conf ${DESTINATION}
atomicapp run ${DESTINATION}

oc create -f ${NULECULE_LIBRARY_HOME}/extras/miq-route.yaml


