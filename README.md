# static-toolbox

This repository includes prebuild static binaries and build-recipes for various tools like Nmap and OpenSSH.

The Linux versions are compiled with the musl-cross toolchain and the openssl-pm-snapshot fork of OpenSSL in order to support a wide range of SSL/TLS features (Warning: some of them are insecure!).

Compilation is done automatically with GitHub Actions.

## Local Setup

Start container:

```
sudo docker run -it -v $(pwd):/workflow-test muslcc/x86_64:arm-linux-musleabihf /bin/sh
```

Inside of the container:

```bash
apk update && apk add bash git
export GITHUB_WORKSPACE=/workflow-test
cd $GITHUB_WORKSPACE
bash build/install_deps_alpine.sh
```

Installing build compiler:

```bash
export ARCH=x86_64-linux-musl
export HOST=https://more.musl.cc/9.2.1/x86_64-linux-musl
export TEMP=/tmp
export USER=0
/bin/sh -c "apk update && apk upgrade && apk add --no-cache curl rsync sudo util-linux && cd / && curl -so ${ARCH}-cross.tgz ${HOST}/${ARCH}-cross.tgz && tar -xf ${ARCH}-cross.tgz && rm ${ARCH}-cross.tgz && cd ${ARCH}-cross"
```
