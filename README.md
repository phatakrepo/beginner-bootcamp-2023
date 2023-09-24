# Terraform Beginner Bootcamp 2023


**Table of Contents**
- [Semantic Versioning] (#sematic-versioning) 
- [Install Terraform Cli] (#install-terraform-cli)
- [Install AWS Cli] (#install-aws-cli)

Terraform boot camp 

#Sematic versioning !! :mage: :cloud:
# This project is going to use semantic versioning for tagging

  **MAJOR.MINOR.PATCH**: e.g: `1.0.1`

    - **MAJOR** version when you make incompatible API changes
    - **MINOR** version when you add functionality in a backward compatible manner
    - **PATCH** version when you make backward compatible bug fixes


**Reference Materials urls**
 https://www.gitpod.io/docs/configure/workspaces/tasks
 https://developer.hashicorp.com/terraform/downloads
 https://en.wikipedia.org/wiki/Shebang_(Unix)
 https://github.github.com/gfm/

 **Set/List environment variables in bash**
 https://linuxize.com/post/how-to-set-and-list-environment-variables-in-linux/

**Setting up environment variables in aws**

...  
export AWS_ACCESS_KEY_ID=```markdown
AKIAIOSFODNN7EXAMPLE
export AWS_SECRET_ACCESS_KEY=wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
export AWS_DEFAULT_REGION=us-west-2
**----**

**Related Documentation**
https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-envvars.html


**Terraform Basics**

Terraform Registry
https://registry.terraform.io/

- **Providers**: In Terraform, "providers" are plugins or extensions that define and manage the resources within a specific cloud or service provider. Providers allow Terraform to interact with various APIs and manage resources such as virtual machines, databases, networking components, and more across different cloud platforms and services.

- **Modules**:"Modules" are a way to organize and reuse Terraform configurations. They allow you to encapsulate and abstract parts of your infrastructure code into reusable components, making it easier to manage and maintain complex infrastructure deployments. Modules are particularly useful when you have repetitive patterns in your infrastructure or when you want to share your infrastructure code across multiple projects or teams.


**Terraform aws provider**
https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket