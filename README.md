# angi_int

## setup
```cd terraform/eks
terraform init
terraform apply
# wait 10 min or so
# can probably automate a pipeline by parsing update-kubeconfig output
# (base) Michaels-MBP:helm mike$ aws eks update-kubeconfig --region us-east-1 --name angi-interview-eks-cluster
#
# Cluster status is CREATING


# setup kube config
aws eks update-kubeconfig --region us-east-1 --name angi-interview-eks-cluster

# build app
cd ../../app
docker build -t miked63017/angi-hello:latest .
docker push miked63017/angi-hello:latest

# goto helm dir
cd ../helm
helm install angi-hello angi-hello

# get url for hello world app
export hello_url=`k get service angi-hello -o "jsonpath={.status.loadBalancer.ingress[0].hostname}"`
curl $hello_url
<p>Hello, World!</p

# Install Prometheus and Loki
kubectl create namespace prometheus
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm upgrade -i prometheus prometheus-community/prometheus --namespace prometheus --set alertmanager.persistentVolume.storageClass="gp2",server.persistentVolume.storageClass="gp2"
# kubectl --namespace=prometheus port-forward deploy/prometheus-server 9090

kubectl create namespace loki
helm repo add loki https://grafana.github.io/loki/charts
helm upgrade -i loki loki/loki-stack --namespace loki
# kubectl --namespace loki port-forward daemonset/loki-promtail 3101

# configure configmaps as desired
# Export to CloudWatch?
```
