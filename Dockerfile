# start with a base image
FROM tesseractshadow/tesseract4re

# Turn off debconf messages during build
ENV DEBIAN_FRONTEND noninteractive
ENV TERM linux

# Install system dependencies
RUN apt-get update && apt-get install -y \
    tesseract-ocr-ell \
    python3-pil \
    python3-requests \
    python3-pip \
 && rm -rf /var/lib/apt/lists/* 
 

RUN pip3 install --upgrade pip


# Add requirements.txt before rest of repo, for caching
COPY requirements.txt /
RUN pip3 install -r /requirements.txt


# update working directories
COPY . .

# Make debconf interactive in the running container
ENV DEBIAN_FRONTEND teletype

# Set useful ENV vars
ENV PYTHONIOENCODING "utf-8"

# Expose and run
EXPOSE 80
CMD ["python3", "app.py"]
