#base image
FROM alpine:3.5

#install the Python pip package to the alpine linux dist
RUN apk add --update py2-pip

#install all Python requirements for our app to run
COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt

#copy files into images
COPY app.py /usr/src/app/
COPY templates/index.html /usr/src/app/templates/

#expose port number
EXPOSE 5000

#run the app
CMD ["python", "/usr/src/app/app.py"] 
