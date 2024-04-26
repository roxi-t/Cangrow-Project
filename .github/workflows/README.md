# CI/CD Pipeline for WordPress Theme Deployment

## Table of Contents
- [Overview](#overview)
- [Workflow](#workflow)
- [Usage](#usage)
- [Configuration](#configuration)
- [Requirements](#requirements)

## Overview
This repository hosts the configurations necessary for a Continuous Integration and Continuous Deployment (CI/CD) pipeline specifically tailored for WordPress theme deployment. It's designed to streamline and automate the process, ensuring that any changes pushed to the main branch are automatically deployed to your WordPress environment.

## Workflow
The CI/CD pipeline is structured into several key actions that are executed in sequence upon a push to the main branch:
1. **Checkout Repository**: Fetches the latest changes from the repository to ensure the pipeline uses the most recent code.
2. **Deploy to WordPress Theme Directory**: Transfers the updated files to the specified WordPress theme directory on the server.
3. **Publish Changes**: Commits the changes to the `gh-pages` branch, triggering the deployment to the live environment.

## Usage
To integrate and utilize this CI/CD pipeline in your WordPress theme deployment:
1. **Fork this Repository**: Start by forking this repository to your GitHub account.
2. **Configure the Workflow**:
   - Navigate to `.github/workflows/main.yml`.
   - Modify the `publish_dir` parameter to point towards your specific WordPress theme directory.
3. **Set Up GitHub Secrets**:
   - Ensure that `GH_PAGES_TOKEN` is configured as a secret in your repository settings. This token should have appropriate permissions for deployment activities.
4. **Trigger Deployment**:
   - Push your changes to the `main` branch. The pipeline will automatically handle the deployment of your WordPress theme based on the latest commits.

## Configuration
Detailed configuration parameters include:
- **`personal_token`**: A GitHub personal access token required for authentication during the deployment process. Ensure it's granted sufficient permissions.
- **`publish_dir`**: Specifies the target directory for deployment within your WordPress theme structure.
- **`publish_branch`**: Identifies the branch where the changes will be pushed for deployment.
- **`allow_empty_commit`**: Option to allow or prevent empty commits in cases where no changes are detected between deployments.

## Requirements
Before using this pipeline, ensure you have:
- Administrative access to the GitHub repository.
- Correct permissions set for the GitHub personal access token.
- Access to modify GitHub repository secrets.

By setting up and configuring the pipeline as described, you can achieve an automated, efficient deployment workflow for your WordPress theme, minimizing manual effort and enhancing productivity.
