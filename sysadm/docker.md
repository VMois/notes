# Docker

## Cheatsheet
- Build image from Docker file:
```bash
docker build -t TAG_NAME dir-with-dockerfile/
```
- Stop all running containers:
```bash
docker stop $(docker ps -aq)
```

- Restart docker:
```bash
sudo systemctl restart docker
```