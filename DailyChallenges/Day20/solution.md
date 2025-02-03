Setup using Kind:
https://github.com/Sagar2366/LearnWithSagar/blob/main/CKA/9_kind_cluster_installation.md

# __Multicluster management:__
-	Orchestrating multiple clusters often deployed across multiple environments (like cloud providers)
-	Supports workload distribution, scaling, and policy enforcement across clusters.
## Importance: 
#### 	Disaster Recovery: 
If one cluster fails, workloads can failover to another cluster, minimizing downtime.
#### 	High Availability: 
Distributes workloads across clusters to avoid single points of failure.
#### 	Compliance and Isolation: 
Clusters can be isolated for regulatory requirements or workload segregation (e.g., production vs. development).
#### 	Performance Optimization: 
Workloads can be placed closer to end users or optimized for specific environments (e.g., GPU-heavy workloads on certain clusters).

# __Multi-Namespace Management__:
-	Refers to partitioning a single cluster into namespaces, dividing resources and managing workloads within the cluster
-	Simplifies resource organization for teams, applications, or environments.

### Importance:
#### •	Team Collaboration: 
Each team or project can operate within its namespace without interfering with others.
#### •	Access Control:
Role-Based Access Control (RBAC) can be applied at the namespace level for fine-grained permissions.
#### •	Efficient Resource Usage:
Quotas ensure that namespaces don’t overconsume cluster resources.


Why Use Multi-Cluster, Multi-Namespace Setups?
-	Disaster recovery
-	High availability
-	Multi-Cloud and Hybrid Strategies:
  Allows leveraging multiple cloud providers to avoid vendor lock-in.
-	Scalability:
  Multi-cluster setups enable scaling across geographic regions, while namespaces ensure logical separation within each 
  cluster.
-	Environment segregation:
  Multi cluster segregrates production, development, staging environments
  Multi namespace setup segregates on a smaller scale like teams


# Understanding Kubeconfig:

Explain how kubeconfig files are used in multi-cluster, multi-namespace environments, including how contexts, users, and clusters are defined and accessed.
Demonstrate how to merge kubeconfig files from different clusters.

#### kubeconfig file:
-	It is a configuration file that Kubernetes uses to authenticate and communicate with cluster.
-	Contains information about clusters, users, and contexts, allowing a user to interact with multiple clusters and   
  namespaces efficiently.

#### Components of a kubeconfig file:
1)	Clusters:
-	Represents the Kubernetes API servers
-	Include the API server URL and a certificate to authenticate the server.
```yaml
clusters:
- name: cluster-1
  cluster:
    server: https://<cluster-1-api-server>
    certificate-authority: /path/to/ca.crt
```
2)	Users:
-	Define credentials for accessing the clusters.
-	Can include tokens, client certificates, or basic authentication details
-	Basically a role you are going to have when switched to that cluster
```yaml
users:
- name: user-1
  user:
    token: <authentication-token>
```
3)	Contexts:
-	A context specifies which cluster and namespace the user interacts with.
```yaml
contexts:
- name: context-1
  context:
    cluster: cluster-1
    user: user-1
    namespace: default
```

A context in multi-cluster setup:
```yaml
contexts:
- name: prod-cluster
  context:
    cluster: prod
    user: admin
    namespace: production
- name: dev-cluster
  context:
    cluster: dev
    user: admin
    namespace: development
```

##### Switch between contexts using: 
```
kubectl config use-context dev-cluster
 ```




## Merging Kubeconfig Files:
When working with multiple clusters, you may have separate kubeconfig files for each. Merging them allows you to manage all clusters from a single kubeconfig.
This can be done in various ways:
#### Method-1:
```
export KUBECONFIG=/path/to/kubeconfig1:/path/to/kubeconfig2
```
#### Method-2: (merge and use the merged file)
```
kubectl config view --merge --flatten > merged-kubeconfig.yaml
export KUBECONFIG=/path/to/merged-kubeconfig.yaml
```

#### --flatten:
Certificates, keys, and paths from the original kubeconfig files are embedded as inline values (encoded in base64). This ensures portability — you can move the merged-kubeconfig.yaml to another machine without needing external files.

## Some commands:
- View current context: `kubectl config current-context`
- List All Contexts:         `kubectl config get-contexts`
- Switch Context:           `kubectl config use-context <context-name>`
- Set context:  `kubectl config set-context dev-context --cluster=dev-cluster --namespace=development`
- Set Namespace Permanently: `kubectl config set-context --current --namespace=development`

## Exam Tips for Multi-Cluster, Multi-Namespace Tasks:
You can save time by creating aliases for repetitive commands
```
alias kctx = 'kubectl config use-context'
alias kns = 'kubectl config set-context --current --namespace'
```
