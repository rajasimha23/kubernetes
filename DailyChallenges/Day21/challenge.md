# Day21 Challenge: Kubernetes Cluster Upgrades: From Minikube to EKS

## Challenge Overview

This challenge focuses on mastering cluster upgrades across diverse environments in Kubernetes, crucial for DevOps engineers and SRE professionals preparing for the CKA exam.

## Why Kubernetes Cluster Upgrades Matter

### Real-World Relevance
Upgrading Kubernetes clusters is a routine task in production environments that helps:
- Patch vulnerabilities
- Improve performance
- Enable new features

### Certification Preparation
Cluster upgrades are a common topic in Kubernetes certification exams like **CKA**. Mastering them saves time during the test and enhances real-world expertise.

### Managed vs. Self-Hosted Clusters
- **Managed Services (e.g., EKS)**: Abstracts complexities but requires careful planning.
- **Self-Hosted Clusters**: Provides more control but demands a deeper understanding of the upgrade process.

## Best Practices for Upgrades
- **Test upgrades** in staging environments before applying to production.
- **Backup clusters** and critical data before starting the upgrade.
- **Read release notes** to identify deprecations and breaking changes.
- **Automate upgrades** where possible to reduce human errors.

---

## Challenge Tasks

### 1. Theory Challenge: Understanding Cluster Upgrades

#### Why Upgrade Clusters?
- Explain the importance of upgrading Kubernetes clusters.
- Discuss risks of outdated cluster versions.

#### Upgrade Strategies
- What are typical upgrade approaches? (e.g., rolling upgrades, blue-green deployments)
- When should you choose one strategy over another?

#### Managed vs. Self-Hosted Clusters
- Highlight key differences in upgrade processes for managed services like **EKS** and self-hosted clusters using **Kubeadm**.
- Discuss unique challenges and best practices for each.

---

### 2. Practical Challenge: Upgrading Clusters in Different Environments

#### 2.1 Minikube Cluster Upgrade
- Upgrade your existing **Minikube** setup to the latest version.
- Verify that the Kubernetes version in the cluster matches the latest stable release.

#### 2.2 Kind Cluster Upgrade
- Create a **Kind** cluster using an older Kubernetes version (e.g., `v1.30.8`).
- Upgrade the **Kind** cluster to the latest version.
- Confirm the upgrade with `kubectl version`.

#### 2.3 Kubeadm Cluster Upgrade
- Create a multi-node Kubernetes cluster using **Kubeadm**.
- Upgrade the **Control Plane** and **Nodes** to a newer Kubernetes version.
- Verify that all components (**kube-apiserver, kube-controller-manager, kube-scheduler**) are updated.

#### 2.4 EKS Cluster Upgrade
- Upgrade the **EKS Control Plane** to a newer version using **AWS CLI**.
- Update the **node groups** to match the Control Plane version.
- Confirm the upgrade with `kubectl version`.

> **Note:** EKS provides an **auto mode** for node groups, reducing manual intervention but requiring monitoring to validate workloads after the upgrade.

---

## Best Practices for Upgrades
- Monitor workloads during the upgrade to ensure no disruptions.
- Use a **phased approach** to minimize risks in production.
- Leverage **EKS version release notes** and upgrade tools for planning.

---

## Submission Guidelines
1. **Answer the theory questions**.
2. **Provide screenshots** of:
   - Pre-upgrade and post-upgrade versions for each cluster.
   - Key commands executed during the upgrade process.
3. **Document your observations and challenges** during the upgrades.
4. Post your progress with hashtags: `#KubernetesUpgrades`, `#DevOpsForAll`, `#ckawithsagar`.

---

## Resources
- [Minikube Upgrade Documentation](https://minikube.sigs.k8s.io/docs/start/)
- [Kind Cluster Guide](https://kind.sigs.k8s.io/docs/)
- [Kubeadm Upgrade Guide](https://kubernetes.io/docs/reference/setup-tools/kubeadm/kubeadm-upgrade/)
- [EKS Cluster Upgrade Documentation](https://docs.aws.amazon.com/eks/latest/userguide/update-cluster.html)
- [YouTube: Kubeadm Upgrades](https://www.youtube.com/results?search_query=kubeadm+upgrades)

Happy Learning! 🚀

