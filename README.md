Откройте проект в редакторе кода

В терминале пропишите python -m venv venv 

Затем venv\scripts\activate

Таким образом создается виртуальное окружение и его активация.

В проекте присутствует файл requirements.txt, пропишите команду pip install -r requirements.txt

Затем пропишите следующие команды для сборки Docker проекта

docker build -t (username_from_dockerhub)/django-nginx-gunicorn-postgres:latest . 

docker login для авторизации

docker push (username_from_dockerhub)/django-nginx-gunicorn-postgres:latest (добавляет репазиторий на docker hub с тегом latest)

docker run -p 8000:80 -p 54321:54321 (username_from_dockerhub)/django-nginx-gunicorn-postgres:latest (запускается сервер, создается контейнер в приложении Docker Desctop, появляется доступ к админ панели 

через адрес http://localhost:8000/admin)

Логин admin 

Пароль adminpass
