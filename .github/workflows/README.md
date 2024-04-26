# CI/CD Pipeline for WordPress Theme Deployment

## Overview
This repository contains the configuration for a Continuous Integration and Continuous Deployment (CI/CD) pipeline designed to automate the deployment process of a WordPress theme. Whenever changes are pushed to the main branch of the repository, the CI/CD pipeline is triggered to deploy the latest changes to the WordPress theme.

## Workflow
The CI/CD pipeline consists of the following steps:

1. **Checkout repository**: Ensures that the latest code from the repository is fetched.
2. **Deploy to WordPress Theme**: Deploys the changes to the designated WordPress theme directory.
3. **Publishing**: Publishes the changes to the gh-pages branch for deployment.

## Usage
To use this CI/CD pipeline for your WordPress theme deployment, follow these steps:

1. Fork this repository.
2. Modify the configuration in the .github/workflows/main.yml file to suit your project requirements, such as changing the publish_dir to point to your WordPress theme directory.
3. Ensure that you have set up the required GitHub secrets, particularly the GH_PAGES_TOKEN, which is used for authentication during deployment.
4. Push your changes to the main branch, and the CI/CD pipeline will automatically deploy your WordPress theme.

## Configuration
- **personal_token**: A personal access token used for authentication during deployment. Ensure that this token has the necessary permissions to deploy changes.
- **publish_dir**: The directory where the changes will be deployed. Modify this path to match the directory structure of your WordPress theme.
- **publish_branch**: The branch to which the changes will be published for deployment.
- **allow_empty_commit**: Determines whether an empty commit should be created if no changes are detected.

By following these instructions and configuring the CI/CD pipeline according to your WordPress theme requirements, you can automate the deployment process and streamline your development workflow.