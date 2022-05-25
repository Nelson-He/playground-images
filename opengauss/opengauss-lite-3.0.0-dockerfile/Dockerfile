FROM openeuler/openeuler:20.03-lts-sp3

LABEL MAIL="dakangsiji@163.com" \
      CREAT_DATE="2022-05" \
      ARCH="x86" \
      GAUSS_SERVER="openGauss-Lite-3.0.0"

RUN yum update -y && \
    yum install -y net-tools wget sudo shadow vim bc && \
    useradd gauss && \
    sed -i "101i gauss ALL=(ALL) NOPASSWD:ALL" /etc/sudoers && \
    sed -i "s/TMOUT=300/TMOUT=0/g" /etc/bashrc && \
    cp -rf /usr/share/zoneinfo/Asia/Beijing /etc/localtime

WORKDIR /home/gauss
USER gauss:gauss

ENV LANG=en_US.utf8 GSQL_INIT_PASSWD=openGauss@1234
RUN mkdir opengauss && \
    wget https://opengauss.obs.cn-south-1.myhuaweicloud.com/3.0.0/x86_openEuler/openGauss-Lite-3.0.0-openEuler-x86_64.tar.gz && \
    tar -xf openGauss-Lite-3.0.0-openEuler-x86_64.tar.gz -C ~/opengauss && \
    rm -f openGauss-Lite-3.0.0-openEuler-x86_64.tar.gz && \
    cd ~/opengauss && \
    echo ${GSQL_INIT_PASSWD} | sh ./install.sh --mode single -D ~/openGauss/data -R ~/openGauss/install --start 
COPY bashrc .bashrc

EXPOSE 5432
CMD ["bash"]