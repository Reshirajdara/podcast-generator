FROM ubuntu:latest

# Update the package index and install necessary packages
RUN apt-get update && apt-get install -y \ 
  python3.10 \ 
  python3-pip \
  git

# Install Python package PyYAML
RUN pip3 install PyYAML

# Copy the feed.py script to the /usr/bin directory
COPY feed.py /usr/bin/feed.py

# Copy the entrypoint.sh script to the root directory
COPY entrypoint.sh /entrypoint.sh

# Ensure the entrypoint script has execution permissions
#RUN chmod +x /entrypoint.sh

# Set the entrypoint to the entrypoint script
ENTRYPOINT ["/entrypoint.sh"]
