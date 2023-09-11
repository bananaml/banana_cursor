# Set the base image
FROM pytorch/pytorch:1.11.0-cuda11.3-cudnn8-runtime

# Set the working directory
WORKDIR /

# Install git
RUN apt-get update && apt-get install -y git

# Upgrade pip and install python packages
RUN pip3 install --upgrade pip
ADD requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

# Add your model weight files (using download.py script)
ADD download.py .
RUN python3 download.py

# Add all other project files
ADD . .

# Expose the port the app runs in
EXPOSE 8000

# Define the command to run the app
CMD python3 -u app.py