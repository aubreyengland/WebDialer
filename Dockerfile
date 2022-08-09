#Using the offical Python image
# https://hub.docker.com/_/python
FROM python:3.9

#Copy local code to the container image
ENV APP_HOME /
WORKDIR $APP_HOME
COPY . .

# copy the requirements file into the image
COPY ./requirements.txt /app/requirements.txt

#Run the webservice on container startup. Here we use the gunicorn webserver
#with one worker process and 8 threads.
#for environments with multiple CPU cores, increase the number of works
#to be equal to the cores available.
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 app:app