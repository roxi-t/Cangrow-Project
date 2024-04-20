#!/bin/bash

# 1. Checkout repository
echo "1. Checking out the repository..."
git checkout main

# 2. Build and Deploy with Docker Compose
echo "2. Building and deploying with Docker Compose..."
docker-compose up -d --build
docker-compose down

# 3. Create .env file
echo "DB_PASSWORD=password" > .env

# 4. Create initial.sh script
echo "#!/bin/bash" > initial.sh
echo "docker-compose up -d" >> initial.sh
chmod +x initial.sh

# 5. Create GitHub Actions workflow
echo "5. Creating GitHub Actions workflow..."
mkdir -p .github/workflows
echo "name: CI/CD Pipeline" > .github/workflows/main.yml
echo "on:" >> .github/workflows/main.yml
echo "  push:" >> .github/workflows/main.yml
echo "    branches:" >> .github/workflows/main.yml
echo "      - main" >> .github/workflows/main.yml
echo "jobs:" >> .github/workflows/main.yml
echo "  build:" >> .github/workflows/main.yml
echo "    runs-on: ubuntu-latest" >> .github/workflows/main.yml
echo "    steps:" >> .github/workflows/main.yml
echo "    - name: Checkout repository" >> .github/workflows/main.yml
echo "      uses: actions/checkout@v2" >> .github/workflows/main.yml
echo "    - name: Build and Deploy" >> .github/workflows/main.yml
echo "      run: |" >> .github/workflows/main.yml
echo "        docker-compose up -d --build" >> .github/workflows/main.yml
echo "        docker-compose down" >> .github/workflows/main.yml

echo "Done! CI/CD setup completed."
