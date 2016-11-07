NULECULE_LIBRARY_HOME="/home/vagrant/nulecule-library"
DESTINATION="/tmp/miq-app-atomicapp"

oc login -u openshif-dev -p devel 
sudo atomicapp stop ${DESTINATION}
oc delete route miq-app


oc login -u admin -p admin 
oc delete pv pv02; 
oc delete pv pv03; 
sudo rm -rf /nfsvolumes/pv0{2,3}; 
sudo mkdir /nfsvolumes/pv0{2,3}; 
sudo chmod 777 /nfsvolumes/pv0{2,3}; 
sudo chown -R nfsnobody:nfsnobody /nfsvolumes/pv0{2,3}; 
oc create -f ${NULECULE_LIBRARY_HOME}/extras/pv02.yaml; 
oc create -f ${NULECULE_LIBRARY_HOME}/extras/pv03.yaml; 


# Cleanup
#oc delete project miq; 
#while oc get pods | grep -q NAME ; do echo "still deleting. sleeping 2 seconds"; sleep 2; done; 
#sleep 10; 
#oc new-project miq; 
#sleep 3; 

#atomicapp run miq-app-atomicapp; 
#oc create -f extras/miq-route.yaml


