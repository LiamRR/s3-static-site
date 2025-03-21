## Project: Simple S3 Static Site Deployment using Terrafrom & Github Actions

### Motivation
Creating a S3 static site is pretty straight forward, we all can agree.  However, since I've no 'real' commercial experience (_because I don't use it for my main job currently on this scale_) with AWS nor Terraform, I've started to work on my portfolio by filling it with 'real world' projects.  As with everything, I try my best to adhere to best practice where possible, this project hopefully highlights this.

### Demo
If you're a fan of Disney's, The Bear, you should get the reference to the domain name and image on [Static Website](https://its.nuunya.business)

### Architecture Overview
![alt text](<images/s3_static_website_architecture_with_user_access.png>)

This project implements a modern, secure, and scalable static website hosting solution using AWS services. The architecture leverages GitHub for version control and CI/CD, with the following AWS components working together: -

- Amazon S3: Primary storage for website files
- Amazon CloudFront: Content delivery network
- AWS Certificate Manager (ACM): SSL/TLS certificate provider
- Amazon Route 53: DNS management

### GitHub Actions
This repository serves as the central location for all website code and infrastructure as code (Terraform).  When changes are pushed to the main branch, GitHub Actions automatically: -

- Validates the Terraform code
- Initializes the Terraform environment
- Plans the infrastructure changes
- Applies the changes to AWS

Benefits: This CI/CD approach ensures consistent deployment, reduces human error, and maintains infrastructure as code best practices.

### Summary
The combination of S3, CloudFront, ACM, and Route 53 creates a robust, secure, and high-performance static website hosting solution.  By leveraging CloudFront and ACM specifically, the architecture provides enhanced security through HTTPS, improved global performance through edge caching, and cost optimization through efficient content delivery—all while maintaining the simplicity and reliability of static website hosting.
