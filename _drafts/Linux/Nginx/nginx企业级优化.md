### 一、Nginx动静分离介绍
-	1.Nginx的静态处理能力很强，但是动态处理能力不足，所以一般会动静分离
-	2.在Nginx的配置中，是通过location配置段配合正则实现静态与动态页面的不同处理
-	3.静态资源页面交给Nginx处理，动态交给后端的容器处理

### 二、Nginx正则匹配
	
### 三、配置动静分离
-	1.处理动态东西
	在http 的server中 加入
```text
    location ~\.php${
        proxy_pass http:// 处理请求地址 ;	
    }
``` 
	        
-	2.处理静态
	在http 的server中 加入 
```text
    location ~.*\.(gif | jpg | peg | bmp | swf)${
        root html;
        expires  1d;	图片缓存
    }
```

### 四、日志切割
-	1.Nginx没有日志分割处理的功能，可以通过Nginx的信号控制功能的脚本来实现日志的自动切割
	并将脚本加入到Linux的计划任务中，让脚本在每天固定时间执行
	
-	2.编写日志切割文本
		设置时间
		设置保存日志路径
		将目前的日志文件进行重命名
		删除时间过长的日志文件
		设置cron任务，定时执行脚本自动进行日志分割
```text
    #!/bin/bash
    # Filename: fenge.sh
    d=$(date -d "-1 day" "+%Y%m%d")   			时间
    logs_path="/var/log/nginx"                			日志目录
    pid_path="usr/local/nginx/logs/nginx/logs/nginx.pid"   	Nginx的PID	
    [ -d $logs_path ] || mkdir -p $logs_path
    mv  /usr/local/nginx/logs/access.log ${logs_path}/test.com-access.log-$d
    kill -USR1 $(cat $pid_path)
    find $logs_path -mtime +30 | xargs rm -rf   删除30十天前的文件
    
    给脚本执行权限  chmod +x /opt/fenge.sh
    给脚本设置定时任务  30  1  *  *  *	/opt/fenge.sh
```
		
### 五、设置连接超时   
	避免同一个用户长时间占用连接，
	在http  server location 中都可以添加
	keepalive_timeout 65 ;  65s
	Client_header_timeout  80; :指定等待客户端发送请求头的超时时间
	Client_body_timeout 80;  设置请求体 读超时 时间

### 六、更改进程数
-	1.意义 ：在高并发场景，需要启动更多的nginx进程以保证快速响应
-	2.查看nginx进程个数   ps aux |grep nginx
-	3.更改进程的数的配置方法
		worker_processes  1;再高并发的情况下可以设置为CPU个数  或者CPU个数的2倍
		查看cpu个数 cat /proc/cpuinfo    processer   cat /proc/cpuinfo | grep -c "physical"
-	4.修改完成，重启服务 ps aux | grep nginx
-	5.默认情况，Nginx的多个进程可能更多的跑在一颗cpu上，可以分配不同的进程给不同的cpu上
	充分利用硬件多核多cpu ,在4核物理服务器，可以配置  Worker_cpu_affinity 0001 0010 0100 1000

### 七、配置网页压缩
-	1.意义：允许服务器将输出内容在发送前进行压缩 ，以节约网络宽带，提示用户的访问体验，默认已经安装 
-	2.可以加入对应的压缩功能参数对压缩性能进行优化
-	3.参数配置：  
		gzip on :开启gzip压缩输出  
		gzip_min_length 1K :用于设置允许压缩的页面最小字节数  
		gzip_buffers 4 16k ： 表示申请4个单位为16k的内存作为压缩结果流缓存，
			默认是申请哦那个与原始数据大小相同的内存空间来存储gzip压缩结果  
		zip_http_version 1.0 : 用于设置识别http协议版本，默认1.1  
		gzip_comp_level 2 :用来指定gzip压缩比例，1压缩比最小，处理速度最快，9最大  
		gzip_types text/plain text/javascript application/x-javascript text/css text/xml
			application/xml application/xml+rss;  
			: 压缩类型，就是对哪些网页文档启用压缩功能  
		gzip_vary  on; 选项可以让前端的缓存服务器缓存经过gzip压缩页面  
-	4.在http段  添加

### 八、防盗链
-	1.什么是防盗链 ： 通过链接，可以获得别人网站资源
-	2.意义：防盗
-	3.配置防盗：
```text
    location ~ * \.(jpg | gif | png | swf )$ {
    		valid_referers none blocked *.test.com test.com;		
    		if($invalid_referer){
    			rewrite ^/ http://www.test.com/img/error.gif;
    			#return 403;
    		}
    	}
```
-	4.解释：valid_referers:设置信任的网站，即能引用相应图片的网站  
		none:浏览器中referer 为空的情况，就是直接在浏览器访问图片  
		blocked:referer不为空的情况，但是值被代理或防火墙删除了  
		后面的网站或者域名：referer中包含相关字符串的网站  
		if语句：如果链接的来源域名不在valid_referers所列出发列表中，$valid_referer为1
		  
### 九、隐藏Nginx版本号
-	1.修改配置文件 ：在Nginx的配置文件中 http{  }  中加入 server_tokens off;
-	2.修改源码法：将下载完成Nginx源码包解压后，到源码目录nginx-1~~~下找到/src/core/nginx.h   
		修改 #define NGINX_VERSION "1.2.3"   //修改版  
		修改 #define NGINX_VER "nginx"  如IIS     //软件类型  

### 十、更改用户与组
-	1.编译安装时指定
		./configure  ... --user=nginx --group=nginx ... 
-	2.修改配置文件法
		修改配置文件 user 选项，指定用户账号
		重启生效
		使用ps aux 命令查看nginx的进程信息

### 十一、配置网页缓存时间
-	1.什么是页面缓存：当Nginx将网页数据返回给客户端后，可设置缓存的时间，
		以便在日后进行相同内容的请求时直接返回，加快访问速度，一般针对静态资源
	
-	2.对以.gif,.jpg结尾的文件缓存
	http中 的 server 中
	location~\.(gif | jpg | ....){
		expires 1d;
	}		

### 十二、负载均衡配置
upstream jetty_server{
   # upstream的负载均衡 weight是权重，可以根据机器配置定义权重。weigth参数表示权值，权值越高被分配到的几率越大
   server 123.206.174.58:8045 weight=2;
   server 119.29.178.133:8045 weight=1;
}			