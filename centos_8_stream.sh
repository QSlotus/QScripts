echo '一键换源中...'
sudo sed -i.bak \
-e 's|^mirrorlist=|#mirrorlist=|' \
-e 's|^#baseurl=|baseurl=|' \
-e 's|http://mirror.centos.org|http://mirrors.cloud.tencent.com|' \
-e 's|gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial|gpgkey=http://mirrors.cloud.tencent.com/centos/RPM-GPG-KEY-CentOS-Official|' \
/etc/yum.repos.d/CentOS-*.repo

sudo dnf clean all
sudo dnf makecache

echo '正在下载epel-release...'

sudo dnf install epel-release -y

echo 'epel-release换源中...'

sudo sed -i.bak \
-e 's|^metalink|#metalink|' \
-e 's|^#baseurl=|baseurl=|' \
-e 's|https://download.example/pub|http://mirrors.cloud.tencent.com|' \
-e 's|gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-8|gpgkey=http://mirrors.cloud.tencent.com/epel/RPM-GPG-KEY-EPEL-8|' \
/etc/yum.repos.d/epel*.repo

sudo dnf clean all
sudo dnf makecache