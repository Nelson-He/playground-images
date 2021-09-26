FROM alpine:latest as BUILDER
LABEL maintainer=tommylikehu@gmail.com

ADD ./util/color.sh .
RUN apk update && apk add git figlet && chmod +x ./color.sh
RUN git clone https://github.com/xero/figlet-fonts.git && cp figlet-fonts/* /usr/share/figlet
RUN figlet openEuler Playground -w 300 -f smslant | ./color.sh 200 > ~/.message

FROM openeuler/openeuler:20.03-lts-sp1
RUN yum -y update && yum -y install zsh curl git && sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN rm -f /etc/localtime && ln -s /usr/share/zoneinfo/Asia/Beijing /etc/localtime
COPY --from=BUILDER ~/.message ~/.message
ADD ./util/.zshrc ~/
ENTRYPOINT ["/bin/zsh"]
