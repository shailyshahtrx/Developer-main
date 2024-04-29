# TRX Developer Portal Documentation

## Purpose 
This repository houses the TRX Services Developer portal and API docs. The audience for this portal and the API documentation it serves are primarily software developers and others who wish to leverage the functionality of TRX Services APIs.

<hr>

## Docs Tools Used
1. [Material for MKDocs]( https://squidfunk.github.io/mkdocs-material/)
2. [Python](https://www.python.org/) or [Docker](https://www.docker.com/) (used for running mkdocs commands)
3. [Git](https://git-scm.com/) and [Github](https://github.com/)

## How to contribute to the API docs
1. Clone the repo to your local dev environment
2. Confirm that Python or Docker is installed
3. [Follow instructions](https://squidfunk.github.io/mkdocs-material/creating-your-site/#previewing-as-you-write) to serve the docs in your dev environment (hot reloads when files change)
4. Create a new branch and make your changes.
5. When you're ready, commit your changes and push them to the remote repo.

<hr>

## Web Server Tools Used
1. [Go](https://go.dev/) for server side programming language.
2. [React + Vite](https://vitejs.dev/guide/) for client side programming.
2. [Stoplight Elements](https://github.com/stoplightio/elements) for the developer sandbox functionality (see source code for style overrides and other tweaks needed to make this appear and function properly for a good experience). 
3. [Tailwind CSS](https://tailwindcss.com/)


### Folder conventions for web server assets
1. ```./static``` contains code and pages for some site functionality (e.g. logon, request access, and developer sandbox).
2. ```./static-docs ``` contains the compiled output of ```./docs``` from the ```mkbuild``` command
3. ```./static-api``` contains static assets for a developer sandbox (e.g. viewing and trying out requests in swagger sandbox).
4. ```./certs``` contains TLS certificate files needed for webserver. The webserver expects 2 files, ssl.crt and ssl.key (unencrypted private key). Currently, the folder and cert files reside on the host v.m. and are made available to the container via a volume at start up.