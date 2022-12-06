# Task
### [Рефактор докерфайла](Dockerfile)
### Внесенные изменения:
###### Изменена версия родительского образа на конкретную, чтобы в будущем не было ошибок зависимостей или уязвимостей
###### Объединены команды RUN логическим оператором, чтобы не вносить дополнительные слои докера
###### Убран скрипт prepare.sh, который нагружает дисковое пространство.
###### Используется dockerignore для md файлов
###### Так как Go lang приложение не использует динамические библиотеки, принято решение двух-ступенчатой сборки с ОС alpine третьей версии, чтобы минимизировать образ, оставив бинарные файлы приложения.

### Build command:
###### docker build -t go-lang-app:latest .

###### Также можно скачать готовый образ из моего dockerhub
###### docker pull cotelette/go-lang-app:latest

### Run container command:
###### docker run -p 8000:3000 -d go-lang-app app:latest


### [Деплой с помощью Ansible playbooks](./ansible)
###### Каталог содержит три плейюбука:
###### [install_docker.yml](./ansible/install_docker.yml) Устанавливает докер на ОС, включен в два следующих скрипта
###### [deploy_go_lang_app.yml](./ansible/deploy_go_lang_app.yml) Устанавливает образ с моей локальной машины, используя абсолютный путь к моему докерфайлу и запускает контейнер.
###### [deploy_go_lang_app_dockerhub.yml](./ansible/deploy_go_lang_app_dockerhub.yml) Альтернативный плейбук, скачивает готовый образ с реестра докерхаб.
### RUN playbook
###### sudo ansible-playbook ansible/deploy_go_lang_app.yml
###### ИЛИ
###### sudo ansible-playbook ansible/deploy_go_lang_app_dockerhub.yml
