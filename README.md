
### To Build:

```
docker build -t docker-runner:latest .

```

### To Run

```

docker run -d -it  -e GIT_URL=URL GIT_TOKEN=TOKEN -e RUNNER_NAME=NAME docker-runner:latest

```