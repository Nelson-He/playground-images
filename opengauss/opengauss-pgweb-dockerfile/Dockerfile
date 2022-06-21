FROM alpine:3.15 AS pgweb
LABEL MAIL="dan.sosedoff@gmail.com"

ARG PGWEB_ADDRESS="https://gitee.com/opengauss/openGauss-webclient/attach_files/1082369/download/openGauss-webclient_linux_amd64.zip"
RUN \
  apk update && \
  apk add --no-cache ca-certificates openssl postgresql wget && \
  update-ca-certificates && \
  rm -rf /var/cache/apk/*
RUN cd /tmp && \
  wget ${PGWEB_ADDRESS} && \
  unzip openGauss-webclient_linux_amd64.zip -d /usr/bin && \
  mv /usr/bin/openGauss-webclient_linux_amd64 /usr/bin/pgweb && \
  rm -f openGauss-webclient_linux_amd64.zip

FROM openeuler/openeuler:20.03-lts-sp3
LABEL MAIL="dakangsiji@gamil.com" \
      CREATE_DATE="2022-05" \
      ARCH="x86" \
      GAUSS_SERVER="openGauss-Lite-3.0.0"

RUN \
   sed -i "s/gpgcheck=1/gpgcheck=0/g" /etc/yum.repos.d/openEuler.repo && \
   yum install -y -q net-tools wget sudo shadow vim bc && \
   useradd gauss && \
   sed -i "101i gauss ALL=(ALL) NOPASSWD:ALL" /etc/sudoers && \
   sed -i "s/TMOUT=300/TMOUT=0/g" /etc/bashrc && \
   cp -rf /usr/share/zoneinfo/Asia/Beijing /etc/localtime

WORKDIR /home/gauss
USER gauss:gauss

ARG GSQL_INIT_PASSWD="openGauss2022"
ENV LANG=en_US.utf8\
    GSQL_INIT_PASSWD=${GSQL_INIT_PASSWD}
RUN mkdir opengauss && \
    wget -q https://opengauss.obs.cn-south-1.myhuaweicloud.com/3.0.0/x86_openEuler/openGauss-Lite-3.0.0-openEuler-x86_64.tar.gz && \
    tar -xf openGauss-Lite-3.0.0-openEuler-x86_64.tar.gz -C ~/opengauss && \
    rm -f openGauss-Lite-3.0.0-openEuler-x86_64.tar.gz && \
    cd ~/opengauss && \
    echo ${GSQL_INIT_PASSWD} | sh ./install.sh --mode single -D ~/openGauss/data -R ~/openGauss/install

COPY postgresql.conf /home/gauss/openGauss/data/
COPY bashrc .bashrc
COPY --from=pgweb /usr/bin/pgweb /usr/bin/pgweb
RUN sudo chmod a+x .bashrc

# Start and create(store) opengauss user
RUN /home/gauss/openGauss/install/bin/gs_ctl start -D /home/gauss/openGauss/data && /home/gauss/openGauss/install/bin/gsql -d postgres  -p 5432  -h 127.0.0.1  -U gauss -W openGauss2022 -f ./initdb.sql && /home/gauss/openGauss/install/bin/gs_ctl stop -D /home/gauss/openGauss/data

# Command to start up opengauss
# 1. /home/gauss/openGauss/install/bin/gs_ctl start -D /home/gauss/openGauss/data
# 2. create opengauss user: gsql -d postgres  -p 5432  -h 127.0.0.1  -U gauss -W openGauss2022 -c "CREATE USER opengauss with createdb IDENTIFIED BY 'openGauss2022'"
# Command to start up pgweb
# 3. /usr/bin/pgweb --bind=0.0.0.0 --listen=8081 --url "postgres://opengauss:openGauss2022@0.0.0.0:5432/postgres?sslmode=disable"
ENTRYPOINT ["bash"]
