# Инструкция по сборке и запуску приложения.
## Authentication
```
export DOCKER_REGISTRY=example.local
export DOCKERFILE=build/Dockerfile
export DOCKER_CONTEXT=.
export MAINTAINER=user@example.ru
read -s DOCKER_USER # пользователь registry
read -s DOCKER_PASSWORD # пароль от registry
docker login -u ${DOCKER_USER} -p ${DOCKER_PASSWORD} ${DOCKER_REGISTRY}
```
## Build App
```
docker build -t ${DOCKER_REGISTRY}/application:${TAG} --build-arg GIT_COMMIT=$(git log -1 --pretty=format:"%h") --build-arg MAINTAINER=${MAINTAINER} -f ${DOCKERFILE} ${DOCKER_CONTEXT}
```
## Publishing
```
docker push ${DOCKER_REGISTRY}/application:${TAG}
```
## Run app
```
docker run -dit --rm -p ${PORT_OUTSIDE}:${PORT_INSIDE} ${DOCKER_REGISTRY}/application:${TAG}
```

