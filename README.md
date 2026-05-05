# BootCamp

This repo was created for **Charkiv BootCamp**.

This project is aimed at developing the first application within Mykhailo Maksymov's team.
However, this project can also be adapted for other applications.

---

## Expected Technologies

| Technology | Role |
|------------|------|
| **GitHub Pages** | Cloud service for displaying static websites. Integrated with github and completely free |
| **Koyeb** | a modern PaaS (Platform as a Service) platform that allows developers to launch applications in the cloud in minutes. |
| **neon postgres** | Cloud service for DB. |

Koyeb and Neon have completely free levels. 
They also have a lower entry threshold, which means it will be easier to work with them.
One of the disadvantages is that they tend to fall asleep when idle, which can cause a delay when the first request is made. There is also no possibility for detailed configuration like in AWS.
<br>

The author has not worked with these technologies yet but will be delighted to learn more about them during the project creation process.
---

## Repository Structure

This repository uses a **branch-based structure** — each branch contains a specific part
of the project configuration:

| Branch | Contents |
|--------|---------|
| [`docker`](../../tree/docker) | Dockerfiles for backend and frontend |
| [`pipeline`](../../tree/pipeline) | GitHub Actions CI configuration |
| [`infra`](../../tree/infra) | Terraform AWS infrastructure |
| [`free`](../../tree/free) | ← you are here — Another technology stack for infrastructure deployment  |
