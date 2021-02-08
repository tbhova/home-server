# https://stackoverflow.com/questions/46401966/install-packages-from-docker-compose-yml-into-docker-container
# https://www.reddit.com/r/codeserver/comments/fmy54o/platformio_ide_home_page_does_not_load_in_docker/

# TODO update with PlatformIO port fix after https://github.com/cdr/code-server/issues/1448

FROM codercom/code-server:latest

# Switch to root for apt install, then switch back.
USER root

RUN sudo apt-get update && apt-get install -y \
        python3-distutils

# https://github.com/ThorbenJensen/code-server-blueprint/blob/master/Dockerfile
# https://github.com/cdr/code-server/issues/171
RUN code-server --install-extension platformio.platformio-ide && \
    code-server --install-extension ms-vscode.cpptools
	
EXPOSE 8010