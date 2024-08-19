# CI-CD

<img src="https://github.com/user-attachments/assets/bf839f1a-75d7-4e46-b688-904194f02c09" width="700"/>

### Project Summary
This project demonstrates a complete CI/CD pipeline that automates the process from code integration to deployment in a Kubernetes environment. It ensures continuous integration, testing, security checks, and deployment.

### Tools Used
- **Jenkins:** Automation of the CI/CD pipeline.
- **Docker:** Containerization of the application.
- **Kubernetes:** Deployment and management of the application, including `Deployment`, `Service`, `PV`, `PVC`, and `StorageClass`.
- **Helm Chart:** Simplification of Kubernetes application management.
- **ArgoCD:** Continuous deployment management.
- **GitHub:** Version control and code repository.


```markdown
### Setup Instructions

#### Step 1: Clone the GitHub Repository
1. **Fork the Repository:**
   - Fork this repository from [here](https://github.com/EladDafna/CI-CD).

2. **Clone the Repository:**
   ```bash
   git clone https://github.com/EladDafna/CI-CD.git
   cd CI-CD
   ```

#### Step 2: Install Docker
Docker is required to build and run containers. To install Docker:

**For Linux:**
   ```bash
   sudo apt-get update
   sudo apt-get install -y docker.io
   sudo systemctl start docker
   sudo systemctl enable docker
   ```

#### Step 3: Install Jenkins
Jenkins automates your CI/CD pipeline. You can install Jenkins using Docker:

1. **Run Jenkins Container:**
   ```bash
   docker run -d --name jenkins -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts
   ```

2. **Access Jenkins:**
   - Open your browser and navigate to `http://localhost:8080`.
   - Follow the on-screen instructions to complete the setup.

#### Step 4: Install Kubernetes (Minikube or Kind)
Kubernetes is required for deploying and managing your application.

**Start Kubernetes Cluster:**
   - **Minikube:**
     ```bash
     minikube start
     ```
   - **Kind:**
     ```bash
     kind create cluster
     ```

#### Step 5: Install Helm
Helm helps manage Kubernetes applications. To install Helm:

**Install Helm on Linux/MacOS:**
   ```bash
   curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
   ```

#### Step 6: Install ArgoCD
ArgoCD manages continuous deployment in Kubernetes.

**Install ArgoCD in Kubernetes:**
   ```bash
   kubectl create namespace argocd
   kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
   ```

**Access ArgoCD:**
   - Forward the ArgoCD server port:
     ```bash
     kubectl port-forward svc/argocd-server -n argocd 8080:443
     ```
   - Open your browser and navigate to `https://localhost:8080`.
   - Log in with the default username `admin` and retrieve the password with the following command:
     ```bash
     kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
     ```

### Deploy the Application via ArgoCD

1. **In the ArgoCD web UI, create a new application with the following settings:**

   - **Application Name:** `my-app`
   - **Project:** `default`
   - **Sync Policy:** `Automatic`
   - **Repository URL:** `https://github.com/EladDafna/CI-CD.git`
   - **Revision:** `main`
   - **Path:** `k8s`
   - **Cluster URL:** `https://kubernetes.default.svc`
   - **Namespace:** `default`

2. **Click `Create` and then `Sync` to deploy the application.**

#### Step 7: Configure Jenkins Pipeline
1. **Create a New Pipeline Job:**
   - Go to Jenkins dashboard, select "New Item", and choose "Pipeline".
   - Configure the pipeline to use your GitHub repository.

2. **Add Credentials:**
   - Add your Docker Hub and GitHub credentials to Jenkins.

3. **Configure Pipeline Script:**
   - Use the `Jenkinsfile` from the repository or create your own.

#### Step 8: Deploy the Application
1. **Run the Pipeline:**
   - Trigger the Jenkins pipeline to run through the entire CI/CD process.

2. **Check Deployment in Kubernetes:**
   - After the pipeline completes, verify that the application is deployed successfully in your Kubernetes cluster:
     ```bash
     kubectl get all



### Project Explanation

1. **Pipeline Setup:** 
   - The Jenkins pipeline is triggered by each push to the GitHub repository.
   - The pipeline pulls the latest code from GitHub, runs automated tests, and creates a Docker image.

2. **Kubernetes Components:**
   - **Deployment:** Manages the deployment of the application.
   - **Service:** Exposes the application to the network.
   - **PersistentVolume (PV) and PersistentVolumeClaim (PVC):** Manages storage for the application.
   - **StorageClass:** Defines the storage type for the application.

3. **Helm Chart Usage:**
   - Helm is used to manage Kubernetes applications with a consistent deployment strategy.
   - **`values.yaml`:** Configuration file that customizes the deployment parameters.
   - **`Chart.yaml`:** file is a crucial component of our Helm chart, containing metadata about the chart such as its name, version, and description. Here's a brief overview of its contents:
```yaml
apiVersion: v2
name: my-application
version: 1.0.0
description: A Helm chart for deploying our application to Kubernetes
```

4. **ArgoCD Integration:**
   - ArgoCD continuously monitors the GitHub repository.
   - Automatically updates the Kubernetes cluster with the latest changes by applying the Helm chart configurations.

This setup ensures a seamless and automated process from code commit to production deployment.

---

You can replace your existing `README.md` content with this updated version to include detailed setup instructions.

4. **ArgoCD Integration:**
   - ArgoCD continuously monitors the GitHub repository.
   - Automatically updates the Kubernetes cluster with the latest changes by applying the Helm chart configurations.

This setup ensures a seamless and automated process from code commit to production deployment.


