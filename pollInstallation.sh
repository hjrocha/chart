# !/bin/bash

# RELEASE=$1
# TIMEOUT_IN_SECS=300
# POLL_INTERVAL_IN_SECS=5
# for i in `seq 1 $(($TIMEOUT_IN_SECS / $POLL_INTERVAL_IN_SECS))`; do
#     result=$(helm history $RELEASE --max=1 -o json)
#     status=$(echo $result | jq .[].status)
#     chart=$(echo $result | jq .[].chart)
#     revision=$(echo $result | jq .[].revision)
#     if [ "\"DEPLOYED\"" != "$status" ]; then
#         echo "$chart: $revision is $status... waiting..."
#     else
#         exit 0
#     fi
# done
# echo "Could not install $RELEASE! Please check the cluster state."
# exit 1

RELEASE_NAME=$1
TIMEOUT_IN_SECS=300
POLL_INTERVAL_IN_SECS=5
release=$(helm list | awk '{print $1}' | tail -n +2 | grep $RELEASE_NAME)
if [ "$release" == "$RELEASE_NAME" ]; then
        echo "Release '$RELEASE_NAME' found."
        exit 0
fi
# for i in `seq 1 $(($TIMEOUT_IN_SECS / $POLL_INTERVAL_IN_SECS))`; do

#     result=$(helm history $RELEASE_NAME --max=1 -o json)
#     status=$(echo $result | jq .[].status)
#     chart=$(echo $result | jq .[].chart)
#     revision=$(echo $result | jq .[].revision)
#     if [ "\"DEPLOYED\"" != "$status" ]; then
#         echo "$chart: $revision is $status... waiting..."
#     else
#         exit 0
#     fi
# done
# echo "Could not install $RELEASE_NAME! Please check the cluster state."
# exit 1