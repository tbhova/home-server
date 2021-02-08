# https://stackoverflow.com/questions/46401966/install-packages-from-docker-compose-yml-into-docker-container

FROM codercom/code-server:latest

# Switch to root for apt install, then switch back.
USER root

RUN sudo apt-get update && apt-get install -y \
        python3-distutils
