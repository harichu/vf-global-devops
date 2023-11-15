0. Chuẩn bị môi trường
+ OS: ubuntu 20
+ nodejs v14.21.3
+ webserver: apache 2.4 + php 8.0

1. Tạo thư mục /system
> mkdir -p /system

2. copy file SFCC-DEPLOY.zip vào /system và giải nén
> cd /system && unzip SFCC-DEPLOY.zip

3. config webserver root trỏ về thư mục `/system/SFCC-DEPLOY/.deploy` ,,,, nhớ phan quyền đọc/ghi thư mục /system/SFCC-DEPLOY/.deploy & /system/SFCC-DEPLOY/CONF cho apache

4. cd vào thư mục /system/SOURCE.SFCC & thực hiện clone bitbucket về thư mục này
> cd /system/SOURCE.SFCC && git clone git@bitbucket.org:vinfast-north-america/commerce.git .

5. cài đặt các thư viện node module
> cd /system/SOURCE.SFCC && curl -o- https://raw.githubusercontent.com/harichu/vf-global-devops/main/npm.install.sh | bash

6. cài đặt cronjob
> crontab -e
```
* * * * * sudo /system/SFCC-DEPLOY/deploy.job > /dev/null 2>&1
* * * * * sudo /system/SFCC-DEPLOY/deploy.notify.job > /dev/null 2>&1
```
