# BootCamp

This repo was created for **Charkiv BootCamp**.

This project is aimed at developing the first application within Mykhailo Maksymov's team.
However, this project can also be adapted for other applications.

> **Note:** The infrastructure described here is conditionally free. Using a private GitHub
> repository creates pipeline costs, so a public repository is used instead. AWS can also be
> a source of costs — however, the free trial period (6 months) and AWS credits are considered.
> The `Free` branch contains alternative technologies with fully free usage.

---

## Project Goals

This is all about **DevOps**:

- Deploying the **frontend**
- Deploying the **backend**
- Deploying the **database**

The project is expected to be deployed on **AWS** cloud services.

---

## Expected Technologies

| Technology | Role |
|------------|------|
| **Docker** | The backend component will run in containers. The frontend will also run in a container for the dev version of the project. |
| **Terraform** | A declarative description of the infrastructure will be created to enable rapid scaling. This approach also makes it easier to transition from development to production. |
| **AWS** | Cloud service where the entire project will be hosted. |
| **GitHub Actions** | Used for the CI part of the pipeline. GitLab CI is also considered as an alternative if the code is hosted on GitLab. |

---

## Repository Structure

This repository uses a **branch-based structure** — each branch contains a specific part
of the project configuration:

| Branch | Contents |
|--------|---------|
| [`docker`](../../tree/docker) | Dockerfiles for backend and frontend |
| [`pipeline`](../../tree/pipeline) | GitHub Actions CI configuration |
| [`infra`](../../tree/infra) | Terraform AWS infrastructure |
