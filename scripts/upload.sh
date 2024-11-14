# George's upload to Qmetry script - replaced by Irfan's code

API_KEY=eacc20ec2e65d4d1112cbf3cf2c73b569f891bc60796576b4f669bde64db580661ede30a24e232171e0b34e67877a47fb5333ecdcda954e606d0dfd1d757f668f82b91b566881cf13820ee8eec7ccd6d

URL=https://qtmcloud.qmetry.com/rest/api/automation/importresult

payload="{ \"format\":\"junit\", \"testCycleToReuse\":\"CHEF-TR-27\", \"matchTestSteps\": false }"
resp=$(curl -s -H "apiKey: $API_KEY" -H "Content-Type: application/json" --data "$payload" $URL)
upload=$(echo $resp | jq -r .url)
trackingId=$(echo $resp | jq -r .trackingId)
results=$(curl -X PUT -H "Content-Type: multipart/form-data" --upload-file /home/ec2-user/regression/junit.xml "$upload")