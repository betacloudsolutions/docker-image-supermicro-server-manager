# docker-image-supermicro-server-manager

Download the ``Supermicro Server Manager (SSM)`` and place the ZIP
archive in the ``files`` directory.

* https://www.supermicro.com/en/solutions/management-software/supermicro-server-manager
* https://www.supermicro.com/SwDownload/UserInfo.aspx?sw=0&cat=SSM

## Usage

```
docker-compose build
docker-compose up -d
```

## Webinterface

The web interface is available on port 8443.

## User guide

```
docker cp ssm:/opt/Supermicro/SSM/docs/SSM_UserGuide.pdf SSM_UserGuide.pdf
```
