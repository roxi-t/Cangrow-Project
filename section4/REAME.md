## Section 4 - CI/CD Workflow

This section outlines the steps to access and review the `main.yml` job file which configures the Continuous Deployment (CD) workflow in this project.

### Step-by-Step Guide

1. **Navigate to the Project Directory**:
   Open your terminal and change to the project directory with the following command:
```shell
cd Cangrow-Project
```
2. **List Project Files**:
List all files in the directory, including hidden ones, using:
```shell
ls -la
```
3. **Access the GitHub Workflow Directory**:
You will find a .github directory listed, which is hidden by default. Navigate to this directory:
```shell
cd .github
```
4. **Enter the Workflow Directory**:
Next, move into the workflows directory where the main.yml file is located:
```shell
cd workflows
```
**Review the CI/CD Configuration**:
Inside the workflows directory, you'll find the main.yml job files. You can open this file using a text editor to view and understand the configuration and instructions for the Continuous Deployment workflow:
```shell
cat main.yml
```
**Exploring the Workflow**:
Feel free to explore the contents of the main.yml file to understand the workflow configurations and instructions. This file contains all necessary configurations for the continuous deployment process of this project, enabling automated updates and deployments upon code changes.
