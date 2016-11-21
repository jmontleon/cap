pushd .
cd ~/mattermost-atomicapp
time atomic stop mattermost-atomicapp . -v
popd

echo "Wait a few seconds for pods to terminate"
echo "Check with: oc get pods"
