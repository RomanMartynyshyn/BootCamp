# BootCamp

This repo created for Charkiv BootCamp. 

This project is aimed at developing the first application within Mykhailo Maksymov’s team. However, this project can also be adapted for other applications.

Hint.
Here is a description of how the author sees the developed infrastructure. But this option is conditionally free. Since using a private repository on github creates pipeline costs, you will have to use a public repository. AWS can also be the main source of costs. However, the use of a free trial period of half a year and credits provided by AWS are considered.
Below is a description of the technologies used. Also in the Free branch there is a description of other technologies that provide for free use.

This is all about DevOps.

 - deploying frontend.
 - deploying backend.
 - deploying DB.

The project is expected to be deployed on AWS cloud services.

Expected technologies:

 - Docker.
    It is expected that the backend component will run in containers. And frontend component will run in container for dev project version.
 - Terraform.
    It is expected that a declarative description of the infrastructure will be created using Terraform to enable rapid scaling of the application’s infrastructure. This approach will also make it easier to transition from the development to the production versions of the project. 
 - AWS.
    Cloud service where all project will be hosted.
 - GitHub Action.
    It is planned to use github actions for the CI part of the pipeline. It is also considering the possible option of using gitlab CI in case the code is hosted on gitlab.

The repository has a branch system.

[Branch with docker files.](../../tree/docker)<br>
- This branch contains dokerfiles for backend and fronend.<br>

[Branch with CI description.](../../tree/pipeline)<br>
- This repository contains the code for github Action, namely the CI part of the pipeline.<br>

[Branch with infrastructure description.](../../tree/infra)<br>
- Describe AWS infrastructure for a project using Terraform<br>
