pushd .
cd ~/etherpad-atomicapp
time atomic stop fusordevel/etherpad-atomicapp . -v
popd


echo "Deleting route in opeshift".
oc delete route etherpad-svc

echo "Wait a few seconds for pods to terminate"
echo "Check with: oc get pods"
