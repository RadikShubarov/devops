# Задания

### [Рефактор докерфайла](Dockerfile)
### Внесенные изменения:
###### Изменена версия родительского образа на конкретную, чтобы в будущем не было ошибок зависимостей или уязвимостей.
###### Убран дубликат библиотек для Go.
###### Объединены команды RUN логическим оператором, чтобы не вносить дополнительные слои докера.
###### Убран скрипт prepare.sh, который нагружает дисковое пространство.
###### Используется dockerignore для md файлов.
###### Так как Go lang приложение не использует динамические библиотеки, принято решение двух-ступенчатой сборки с ОС alpine третьей версии, чтобы минимизировать образ, оставив бинарные файлы приложения.

### [Было:](https://code.dev.gazprom-neft.ru/gpn-cup-2022/test-task/-/blob/master/Dockerfile)
### [Стало:](Dockerfile)

# Инструкция для сборки образа и запуска контейнера
### Команда сборки образа:
###### docker build -t go-lang-app:latest .

###### Также можно скачать готовый образ из моего dockerhub:
###### docker pull cotelette/go-lang-app:latest

### Команда запуска конейнера:
###### docker run -p 8000:3000 --rm -dit go-lang-app:latest

# Ansible

### [Деплой с помощью Ansible playbooks](./ansible)
###### Каталог содержит три плейюбука:
###### [install_docker.yml](./ansible/install_docker.yml) Устанавливает докер на ОС, включен в два следующих скрипта:
###### [deploy_go_lang_app.yml](./ansible/deploy_go_lang_app.yml) Меняет докерфайл клонируемого репозитория с заданием на докерфайл с моего репозитория и запускает контейнер.
###### [deploy_go_lang_app_dockerhub.yml](./ansible/deploy_go_lang_app_dockerhub.yml) Альтернативный плейбук, скачивает мой готовый образ с реестра докерхаб.
### Команда запуска плейбуков:
###### sudo ansible-playbook ansible/deploy_go_lang_app.yml
###### или для второго варианта:
###### sudo ansible-playbook ansible/deploy_go_lang_app_dockerhub.yml

# Helm chart
### [Деплой с помощью Helm chart](./helm)
### Команда деплоя для Helm:
###### helm install app chart/ --set replicaCount=2

# Jenkins
### [Деплой с помощью Jenkinsfile](./jenkins)
###### Используя Bash и образ из докерхаб: [Jenkinsfile](./jenkins/Jenkinsfile)
###### Используя Bash и данный репозиторий: [Jenkinsfile1](./jenkins/Jenkinsfile1)
