# Dotnet Jupyter notebook stack

This is forked from the minimal-notebook stack found here: https://github.com/jupyter/docker-stacks

### Build It:
```sh
docker build -t dotnet-notebook:urtag .
```

### Or run it via docker-compose.yml:
```yaml
services:
  dotnet-notebook:
    build:
      context: ./dotnet-notebook
    ports:
      - 8888:8888
```

```sh
docker-compose up -d dotnet-notebook
```
### Logging In
Your "token" can be used to set a password for a fresh instance.
The token is printed in the docker logs on startup.
```sh
docker logs foldername_dotnet-notebook_1
```
where "foldername" is the folder containing your `docker-compose.yml` file.

You can verify this by running `docker ps`.

## Relevant docs:
* [Dotnet Jupyter Notebooks using dotnet/try](https://github.com/dotnet/try/blob/master/NotebooksLocalExperience.md)
* [Jupyter Docker Stacks on ReadTheDocs](http://jupyter-docker-stacks.readthedocs.io/en/latest/index.html)
* [Selecting an Image :: Core Stacks :: jupyter/minimal-notebook](http://jupyter-docker-stacks.readthedocs.io/en/latest/using/selecting.html#jupyter-minimal-notebook)
