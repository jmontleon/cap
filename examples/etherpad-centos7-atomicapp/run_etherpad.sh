# We want to be logged in with the external IP address of openshift
rm -f ~/.kube/config

oc login 10.0.2.15:8443 --certificate-authority=/var/lib/openshift/openshift.local.config/master/ca.crt -u openshift-dev -p devel
if [ "$?" -ne "0" ]; then
    exit
fi

oc new-project cap

atomic run projectatomic/etherpad-centos7-atomicapp --mode fetch --destination ~/etherpad-centos7-atomicapp
if [ "$?" -ne "0" ]; then
    exit
fi

export ACCESS_TOKEN=`oc whoami -t`
sed "s/ACCESS_TOKEN/${ACCESS_TOKEN}/g" answers.conf.tmpl > answers.conf
sudo cp answers.conf /home/vagrant/etherpad-centos7-atomicapp
if [ "$?" -ne "0" ]; then
    exit
fi

pushd .
cd ~/etherpad-centos7-atomicapp
time atomic run projectatomic/etherpad-centos7-atomicapp . -v
if [ "$?" -ne "0" ]; then
    exit
fi
popd

# Sleeping 30 seconds to allow time for services to come up
sleep 30
oc get svc

oc expose service etherpad-svc -l name=etherpad
