## explicitly specify the number of nodes and their types then we would use the following command:
#gcloud config set project-jupyter-hub

gcloud container clusters create dask_cluster \
--zone us-east4-c \
--num-nodes 4 \
--master-machine-type n1-standard-2 \
--project project-jupyter-hub
--bucket bucket-name="gs://jhub-storage/"  # Not sure if works

gcloud compute instances list
gcloud container clusters describe dask_cluster
#You will notice toward the end of the output there is a username and password.

kubectl cluster-info






