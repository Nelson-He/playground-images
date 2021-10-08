ARG GOTTY_IMAGE="opensourceway/gotty:latest"

FROM alpine:latest as BUILDER
LABEL maintainer=tommylikehu@gmail.com
ARG MESSAGE="openEuler Playground"

# prepare zsh and welcome message
ADD ./util/color.sh .
RUN apk update && apk add git figlet bash && chmod +x ./color.sh
RUN git clone https://github.com/xero/figlet-fonts.git && cp figlet-fonts/* /usr/share/figlet
RUN figlet -w 300 -f smslant ${MESSAGE} | ./color.sh 200 > /.message

# prepare gotty from official hub
FROM $GOTTY_IMAGE as GOTTY_LOADER
RUN echo done

# prepare user and workspace
FROM openeuler/openeuler:20.03-lts-sp1
ARG user=coder
ARG group=coder
ARG uid=1000
ARG gid=1000
RUN yum -y update && yum -y install zsh curl git shadow-utils sudo
RUN groupadd ${group} --gid ${uid} && useradd ${user} --uid ${uid} --gid ${gid} && \
    echo "${user}:openEuler@osinfra" | chpasswd && gpasswd -a ${user} wheel && \
    echo "%wheel	ALL=(ALL)	NOPASSWD: ALL" | tee -a /etc/sudoers
RUN rm -f /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Beijing /etc/localtime

USER ${user}
RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

COPY --from=BUILDER --chown=${user}:${group} /.message /home/${user}
COPY --from=GOTTY_LOADER --chown=${user}:${group} /app/gotty /app/
COPY --chown=${user}:${group} ./util/.zshrc /home/${user}

WORKDIR /workspace
ENV TERM=xterm
ENTRYPOINT ["/app/gotty"]
