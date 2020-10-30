# static-toolbox

This repository includes prebuild static binaries and build-recipes for various tools like Nmap and OpenSSH.

The Linux versions are compiled with the musl-cross toolchain and the openssl-pm-snapshot fork of OpenSSL in order to support a wide range of SSL/TLS features (Warning: some of them are insecure!).

Compilation is done automatically with GitHub Actions.

## Local Setup

Start container:

```
sudo docker run -it muslcc/x86_64:armel-linux-musleabihf /bin/sh
```

Inside of the container:

```bash
apk update && apk add bash git
git clone https://github.com/takeshixx/workflow-test.git
export GITHUB_WORKSPACE=/workflow-test
cd $GITHUB_WORKSPACE
bash build/install_deps_alpine.sh
```
