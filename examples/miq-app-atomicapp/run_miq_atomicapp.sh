pushd .

NULECULE_LIBRARY_HOME="/home/vagrant/nulecule-library"
DESTINATION="/tmp/miq-app-atomicapp"

oc login -u admin -p admin
oadm policy add-scc-to-user privileged system:serviceaccount:miq:default

oc login -u openshift-dev -p devel
oc new-project miq
mkdir -p ${DESTINATION}
atomic run miq-app-atomicapp --mode fetch --destination ${DESTINATION}

export ACCESS_TOKEN=`oc whoami -t`
sed "s/ACCESS_TOKEN/${ACCESS_TOKEN}/g" answers.conf.tmpl > answers.conf
sudo cp answers.conf ${DESTINATION}
if [ "$?" -ne "0" ]; then
    exit
fi

pushd .
cd ${DESTINATION}
time atomic run miq-app-atomicapp . -v
if [ "$?" -ne "0" ]; then
    exit
fi
popd

oc create -f ${NULECULE_LIBRARY_HOME}/extras/miq-route.yaml
echo "Allow ~5 minutes for the miq-app container to come up and initialize"
