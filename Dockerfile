FROM python:3.6


# Set the working directory to /app
WORKDIR /app

RUN pip install -U spacy
RUN python -m spacy download en_core_web_lg
RUN python -m spacy download nl_core_news_sm

# Install any needed packages specified in requirements.txt
RUN pip install flask_ngrok flask_cors langdetect

# Copy the current directory contents into the container at /app
COPY ./wsgi.py ./app ./en_model-0.0.0/dist/en_model-0.0.0.tar.gz ./

RUN ls
#install the model 
RUN pip install ./en_model-0.0.0.tar.gz

ENTRYPOINT ["python"]
# Run app.py when the container launches
CMD ["wsgi.py"]