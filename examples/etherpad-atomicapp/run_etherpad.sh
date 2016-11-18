# We want to be logged in with the external IP address of openshift
rm -f ~/.kube/config

oc login 10.1.2.2:8443 --certificate-authority=/var/lib/openshift/openshift.local.config/master/ca.crt -u openshift-dev -p devel
if [ "$?" -ne "0" ]; then
    exit
fi

oc new-project cap

atomic run fusordevel/etherpad-atomicapp --mode fetch --destination ~/etherpad-atomicapp
if [ "$?" -ne "0" ]; then
    exit
fi

export ACCESS_TOKEN=`oc whoami -t`
sed "s/ACCESS_TOKEN/${ACCESS_TOKEN}/g" answers.conf.tmpl > answers.conf
sudo cp answers.conf /home/vagrant/etherpad-atomicapp
if [ "$?" -ne "0" ]; then
    exit
fi

pushd .
cd ~/etherpad-atomicapp
time atomic run fusordevel/etherpad-atomicapp . -v
if [ "$?" -ne "0" ]; then
    exit
fi
popd

# Sleeping 30 seconds to allow time for services to come up
echo "Sleeping for 30 seconds to allow time for pods to come up."
sleep 30

echo "Checking what services are running."
oc get svc

echo ""
echo "Exposing the etherpad-svc service so it is externally accessible"
oc expose service etherpad-svc -l name=etherpad


ROUTE_INFO=`oc get routes etherpad-svc | head -n2 | tail -n 1`
ROUTE_INFO_ARRAY=( ${ROUTE_INFO} )
echo ""
echo "The etherpad service is accessible with the external URL:"
echo "${ROUTE_INFO_ARRAY[1]}"
