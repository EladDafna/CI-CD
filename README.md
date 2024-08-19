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
   -  **`Chart.yaml`:** file is a crucial component of our Helm chart, containing metadata about the chart such as its name, version, and description. Here's a brief overview of its contents:
```yaml
apiVersion: v2
name: my-application
version: 1.0.0
description: A Helm chart for deploying our application to Kubernetes
```

4.  **ArgoCD Integration:**
   - ArgoCD continuously monitors the GitHub repository.
   - Automatically updates the Kubernetes cluster with the latest changes by applying the Helm chart configurations.

This setup ensures a seamless and automated process from code commit to production deployment.



