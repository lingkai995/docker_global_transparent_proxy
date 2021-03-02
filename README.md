# docker_global_transparent_proxy
使用clash +docker 进行路由转发实现全局透明代理

## 食用方法
1. 开启混杂模式

    `ip link set eth0 promisc on`

1. docker创建网络,注意将网段改为你自己的

    `docker network create -d macvlan --subnet=192.168.1.0/24 --gateway=192.168.1.1 -o parent=eth0 br0`

1. 提前准备好正确的clash config

1. 运行容器

    `sudo docker run -d --name clash -v 你配置文件的路径/config.yaml:/root/.config/clash/config.yaml --cap-add=NET_ADMIN --device /dev/net/tun --network br0 --ip 192.168.1.4 --privileged lingkai995/clash-tproxy`

1. 将手机/电脑等客户端 网关设置为容器ip,如192.168.1.4 ,dns也设置成这个


群晖docker安装请在任务计划里设置开机启动时运行如下命令，并手动运行一次，以安装tun模块
insmod /lib/modules/tun.ko
