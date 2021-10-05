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

FROM openeuler/openeuler:20.03-lts-sp1
RUN yum -y update && yum -y install zsh curl git && sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN rm -f /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Beijing /etc/localtime
COPY --from=BUILDER /.message /root/
COPY --from=GOTTY_LOADER /app/gotty /app/
ADD ./util/.zshrc /root/
ENTRYPOINT ["/app/gotty"]
