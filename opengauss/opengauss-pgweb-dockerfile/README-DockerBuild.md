##  如何构建镜像

* 不传入参数，使用默认参数

  > 默认参数分别是：
  >
  > PGWEB_ADDRESS="https://github.com/sosedoff/pgweb/releases/download/v0.11.11/pgweb_linux_amd64.zip"
  >
  > GSQL_INIT_PASSWD="openGauss@2022"

```shell
# 不传入参数时，构建镜像方式,示例如下：
build -t <image_name>:<image_version> .
```

* 传入参数，使用参数构建

  > 使用传入参数将替换默认参数

```shell
# 传入参数，构建镜像方式，示例如下：
build -t <image_name>:<image_version> \
--build-arg PGWEB_ADDRESS=<Your pgweb address> \
--build-arg GSQL_INIT_PASSWD=<Your define password> .
```

