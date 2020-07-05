FROM fedora:31
RUN dnf -y update && dnf -y install emacs
RUN ["useradd","-m","ocuser"]
RUN ["cat","/etc/sudoers"]
RUN ["sed","--help"]
# RUN ["sed","-i","'s/#include/ocuser ALL=(ALL) NOPASSWD: ALL#include/'","/etc/sudoers"]
RUN sed -i 's/#include/ocuser\tALL=(ALL)\tNOPASSWD: ALL\n\n#include/' /etc/sudoers
WORKDIR /home/ocuser
USER ocuser
COPY --chown=ocuser:ocuser ocuser/* ./
ENTRYPOINT ["/bin/bash"]
