# Rippled Documentation Builder

Docker image for building [rippled](https://github.com/ripple/rippled) HTML docs.

## Dependencies

- [docker](https://docs.docker.com/engine/installation/)

## Run

```
docker run -e GIT_REMOTE=ripple GIT_BRANCH=master -v $PWD:/opt/docs --rm bwilsonripple/rippled-docs:latest
```

After building the docs, an `html` folder will be copied to your current working directory. Navigate to the `html/index.html` file in your browser to see the docs.

Substitute `GIT_REMOTE` and/or `GIT_BRANCH` to build docs for your own branch.

## Allergic to Docker?

Reference the `Dockerfile` and `build_docs.sh` files in this repo for instructions for building rippled docs locally.
