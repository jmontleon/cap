# We want to be logged in with the external IP address of openshift
rm -f ~/.kube/config

oc login 10.1.2.2:8443 --certificate-authority=/var/lib/openshift/openshift.local.config/master/ca.crt -u openshift-dev -p devel
if [ "$?" -ne "0" ]; then
    exit
fi

oc new-project cap

atomic run fusordevel/mattermost-atomicapp --mode fetch --destination ~/mattermost-atomicapp
if [ "$?" -ne "0" ]; then
    exit
fi

export ACCESS_TOKEN=`oc whoami -t`
sed "s/ACCESS_TOKEN/${ACCESS_TOKEN}/g" answers.conf.tmpl > answers.conf
sudo cp answers.conf /home/vagrant/mattermost-atomicapp
if [ "$?" -ne "0" ]; then
    exit
fi

pushd .
cd ~/mattermost-atomicapp
time atomic run fusordevel/mattermost-atomicapp . -v
if [ "$?" -ne "0" ]; then
    exit
fi
popd



