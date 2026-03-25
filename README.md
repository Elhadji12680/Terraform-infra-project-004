# Terraform AWS Infrastructure Project

## Overview
This project focuses on building AWS infrastructure using Terraform with a modular approach. 

I created separate modules for core components like VPC and EC2, and used GitHub Actions to automate Terraform workflows such as plan, apply, and destroy.

This is an ongoing project where I’m improving structure, automation, and best practices.

---

## What This Project Includes

- Custom VPC setup  
- EC2 provisioning using a reusable module  
- Terraform configuration using variables and locals  
- GitHub Actions pipeline for infrastructure deployment  
- Environment-based configuration (dev.tfvars)  

---


---

## How It Works

- Infrastructure is defined using Terraform modules  
- Changes are pushed to GitHub  
- GitHub Actions runs Terraform commands automatically  
- Separate workflow handles destroy when needed  

---

## What I Learned

- Structuring Terraform code using modules  
- Automating infrastructure with CI/CD pipelines  
- Managing environments using tfvars  
- Debugging and fixing Terraform configuration issues  

---

## Notes

This project is still in progress and I’m actively improving it by adding more services and refining the pipeline.
