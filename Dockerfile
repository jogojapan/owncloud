FROM fedora:31
RUN dnf -y update && dnf -y install emacs
RUN ["useradd","-m","ocuser"]
WORKDIR /home/ocuser
USER ocuser
COPY --chown=ocuser:ocuser ocuser/* ./
ENTRYPOINT ["/bin/bash"]
