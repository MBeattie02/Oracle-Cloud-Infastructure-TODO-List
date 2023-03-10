#!/bin/bash


# Fail on error
set -e

# Delete Object Store
echo "Deleting Object Store"
# Per-auth

# ## delete object storage bucket
# oci os bucket delete --bucket-name "$(state_get RUN_NAME)"

PARIDS=`oci os preauth-request list --bucket-name "$(state_get RUN_NAME)" --query "join(' ',data[*].id)" --raw-output`
for id in $PARIDS; do
    oci os preauth-request delete --par-id "$id" --bucket-name "$(state_get RUN_NAME)" --force
done
 
# Object
if state_done WALLET_ZIP_OBJECT; then
  oci os object delete --object-name "wallet.zip" --bucket-name "$(state_get RUN_NAME)" --force
  state_reset WALLET_ZIP_OBJECT
fi

# Object
if state_done CWALLET_SSO_OBJECT; then
  oci os object delete --object-name "cwallet.sso" --bucket-name "$(state_get RUN_NAME)" --force
  state_reset CWALLET_SSO_OBJECT
fi

# Bucket
if state_done OBJECT_STORE_BUCKET; then
   oci os bucket delete --bucket-name "$(state_get RUN_NAME)" --force
 state_reset OBJECT_STORE_BUCKET
fi
