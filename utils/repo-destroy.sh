#!/bin/bash


# Fail on error
set -e


# Delete Images
echo "Deleting Images"
IIDS=`oci artifacts container image list --compartment-id "$(state_get COMPARTMENT_OCID)" --query "join(' ',data.items[*].id)" --raw-output`
for i in $IIDS; do
  oci artifacts container image delete --image-id "$i" --force
done

# Delete Repos
echo "Deleting Repositories"
REPO_IDS=`oci artifacts container repository list --compartment-id "$(state_get COMPARTMENT_OCID)" --query "join(' ', data.items[*].id)" --raw-output`
for r in $REPO_IDS; do 
  oci artifacts container repository delete --repository-id "$r" --force
done

