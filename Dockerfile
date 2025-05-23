#Pyhton muhitni import qilamiz
FROM python:3.11-slim

# Docker ichida loyiha ishlashi uchun katalog
WORKDIR /dilmurod

#Kantenir ichiga requarimentni import qilamiz
COPY requirements.txt /dilmurod/

#Kerakli kutubhonani o'rnatamiz
RUN pip install --no-cache-dir -r requirements.txt

#Django loyihamizni kontenerga o'tqazamiz
COPY . /dilmurod/

ENV PYTHONUNBUFFERED=1


#Qaysi posrtda ishlashi
EXPOSE 8012

#Dockerni ishga tushirish komandasi
CMD ["bash", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8012"]