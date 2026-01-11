Inception-of-Things is a 42 project where you build and manage lightweight Kubernetes clusters with K3s/K3d, automate app deployment, and finish with GitOps using Argo CD.
The README below is tailored to the official subject parts (K3s + Vagrant, K3s apps, K3d + Argo CD) and you can adapt names/paths to your repo.

***

## Inception-of-Things

Inception-of-Things (IoT) is a post–common-core 42 project that introduces Kubernetes from a developer perspective using lightweight distributions like K3s and K3d.
The project is divided into three parts: building a K3s cluster with Vagrant, deploying simple apps on K3s, and setting up a K3d cluster managed via Argo CD (GitOps).

***

## Objectives

- Set up local Kubernetes clusters using **K3s** on virtual machines and **K3d** on Docker, understanding control-plane vs worker roles.
- Deploy basic web applications using Kubernetes primitives (pods, deployments, services, ingresses) and expose them externally.
- Discover **GitOps** with **Argo CD**, syncing cluster state from a Git repository instead of manual kubectl commands.

***

## Project structure

> Example layout; adapt to your repo.

```txt
inception-of-things/
├── p1/
│   ├── Vagrantfile
│   ├── scripts/
│   └── k3s-config/
├── p2/
│   ├── manifests/
│   └── kustomization.yaml
└── p3/
    ├── k3d-config/
    ├── argocd/
    └── apps/
```

- `p1`: Vagrant definitions and provisioning scripts to create a small K3s cluster (server + agent).
- `p2`: Kubernetes manifests for the three simple applications required by the subject (deployments, services, ingress).
- `p3`: K3d cluster configuration and Argo CD application definitions used to manage workloads via GitOps.

***

## Part 1 – K3s & Vagrant

This part focuses on creating a K3s cluster with at least one **server** node and one **agent** node, running in virtual machines managed by Vagrant.
Vagrant provisioning scripts install K3s, configure the cluster (kubeconfig, tokens), and ensure that the nodes can communicate properly.

Typical workflow:

- `cd p1`  
- `vagrant up` to create and provision the VMs and install K3s.
- Use the generated kubeconfig to run `kubectl get nodes` and verify the cluster from the host.

***

## Part 2 – K3s applications

In this part, you deploy three simple applications  on the K3s cluster created in part 1.
You define Kubernetes objects such as deployments, services, and ingresses to expose each app externally via an ingress controller.

Key concepts:

- **Deployments** to manage replicas and rolling updates for each app.
- **Services** to group pods, and **Ingress** rules to route HTTP traffic to the correct service based on host/path.

***

## Part 3 – K3d & Argo CD

The last part uses **K3d** to run a Kubernetes cluster inside Docker on the host and introduces **Argo CD** to implement GitOps.
Instead of applying manifests manually, Argo CD monitors a Git repository and continuously syncs the cluster with the declared state.

Core elements:

- K3d cluster creation (e.g. via a config file or CLI options specifying ports and agents).
- Argo CD installation and configuration, plus one or more Argo CD Applications pointing to your manifests repository/paths.

***

## Requirements & constraints

- Use only the technologies and tools allowed in the subject (K3s, K3d, Vagrant, Argo CD, Docker, etc.).
- Provide reproducible setups: a fresh clone and the documented commands should be enough to rebuild clusters and redeploy apps from scratch.

***

## How to run


- **Part 1**: `cd p1 && vagrant up` then configure `KUBECONFIG` from the generated file.  
- **Part 2**: Apply manifests against the K3s cluster, e.g. `kubectl apply -k p2`
- **Part 3**: Create the K3d cluster, install Argo CD, then point Argo CD to the Git repo path containing your manifests.

***

## Learning outcomes

- Better understanding of Kubernetes architecture (control plane, nodes, pods, services, ingress) through hands-on K3s/K3d usage.
- First exposure to GitOps philosophy with Argo CD, separating desired state in Git from the cluster that enforces it.
