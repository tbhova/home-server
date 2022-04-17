# https://stackoverflow.com/questions/46401966/install-packages-from-docker-compose-yml-into-docker-container
# https://www.reddit.com/r/codeserver/comments/fmy54o/platformio_ide_home_page_does_not_load_in_docker/

# TODO update with PlatformIO port fix after https://github.com/cdr/code-server/issues/1448

FROM codercom/code-server:latest

# Switch to root for apt install, then switch back.
USER root

# https://github.com/coder/code-server/issues/1448#issuecomment-856604411
RUN apt-get update && \
    apt-get install -y --no-install-recommends python3 python3-distutils python3-dev python3-pip curl make && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

USER coder

# https://github.com/ThorbenJensen/code-server-blueprint/blob/master/Dockerfile
# https://github.com/cdr/code-server/issues/171
RUN code-server --install-extension platformio.platformio-ide --force && \
    code-server --install-extension ms-vscode.cpptools --force && \
    code-server --install-extension ms-toolsai.jupyter --force && \
    code-server --install-extension ms-python.python --force

EXPOSE 8010