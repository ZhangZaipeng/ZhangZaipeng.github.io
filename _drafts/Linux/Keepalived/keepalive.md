#### keepalived 是什么

#### keepalived 安装与启动
图片1
- 1.通过yum 安装依赖包  
    yum -y install kernel-devel openssl-devel popt-devel
- 2.编译安装Keepalived(安装目录为根目录)  
    	./configure --prefix=/ --with-kernel-dir=/usr/src/kernels/2.6.32.....
- 3.主从双机热备
  - 1.常用配置项
        图片2
        图片3
        图片4
  - 2.master配置
        图片5
  - 3.slave 服务器
        查看一下 SELinux getenforce
        临时关闭 setenforce 0 #设置SELinux 成为permissive模式
        保证两台主机 scp命令可以使用
        把master的配置文件cp过来：主机IP:/etc/keepalived/keepalived.conf 
        
        图片6
        图片7
- 4.测试效果
        图片8

#### 下载地址
www.keepalived.org