### 一、安装步骤
-	1.讲selinux 设置为disabled
-	2.安装依赖包 pcre-devel zlib-devel ---> rpm -qa | grep pcre-devel zlib-devel 
-	3.yum -y install pcre-devel zlib-devel
-	4.创建运行用户，组
		useradd -M -s /sbin/nologin nginx
		groupadd nginx
-	5.解压ngnix包
		tar xf ngni -C /usr/src/
-	6.  ./configure --prefix=/usr/local/nginx  --user=nginx  --group=nginx  
			--with-http_stub_status_module
-	7.make && make install
-	8.为主程序nginx创建链接文件
		ln -s /usr/local/nginx/sbin/nginx    /usr/local/sbin/

### 二、Nginx的运行控制方法
-	1.nginx -t 检测配置文件语法
-	2.执行nginx主程序启动Nginx  nginx
-	3.killall命令结合信号对Ngnix进程执行停止操作 
-	4.编写启动脚本，添加为系统服务脚本  
    得到Ngnix PID   --->修改ngnix/conf/ngnix.conf文件		-->  去掉 配置文件中 # pid   logs/nginx.pid
		---->杀死ngnix服务   netstat -anpt |grep :80   kill -9 进程号
		--->重启ngnix  nginx

```text
#！/bin/bash
# chkconfig: 35 99 20
# description Ngnix server control script
PROG="/usr/local/nginx/sbin/nginx"
PIDF="/usr/local/nginx/logs/nginx.pid"
case "$1" in
    start)
    $PROG
    ;;
    stop)
    kill -s QUIT $(cat $PIDF)
    ;;
    restart)
    $0 stop
    $0 start
    ;;
    reload)
    kill -s HUP $(cat $PIDF)
    ;;
    *)
    echo "Usage: $0 (start|stop|restart|reload)"
    exit 1
esac 
exit 0
```
-	5.给脚本加执行权限  
	    将文件 >  /etc/init.d/nginx  
		chmod +x /etc/init.d/nginx  

-	6为服务添加启动项  
		chkconfig --add nginx  
		chkconfig --list nginx  

-	7测试脚本  
		service nginx stop  
		lsof -i :80  查看进程  
		service ngnix start  
		lsof -i :80  查看进程  
		
### 三、配置文件分析  
-	1~9	全局配置项  
		设置Ngnix服务的运行用户，工作进程数，错误日志，PID存放位置  
		user nobofy   运行用户为nobody  
		worker_processes 1  可以根据cpu核心总数来指定工作进程数  
		error_log  
		pid logs/nginx.pid  
		
-	12~14  I/O时间  2.6及以上版本的内核 用epoll  
  计算最大连接数 ： worker_processes * worker_connection
```text
    events{
        use epoll;
        worker_connection 1024;
    }
```
		 
-	17~
		http{}
		设置访问日志  --> access_log  
		HTTP端口、-->   
		网页目录-->  
		是否支持文件发送-->sendfile  
		连接保持时间-->keepalive  
		监听端口-->listen  
		server{
			字符集  charset 
			设置网站名称 -->server_name
			根目录配置 -->location /{
				网站根目录的位置 --> root
				默认首页-->index		
			}
		}
		
### 四、构建静态网站
-	1.修改主配置文件
		server{
			root  /var/www/html(注意要创建该目录)
		}
-	2.准备网站目录测试网页
		在 /var/www/html  加入页面
		nginx -t  检查语法
-	3.配置本地解析
-	4启动并检查服务是否正常	