# GIT
## 一、Git和SVN的对比：
	1）Git是分布式的，SVN是集中式； 
	2）Git每个历史版本存储完整的文件，SVN存储文件的差异；
	3）Git可离线完成大部分操作，SVN则必须与中央服务器进行网络交互；
	4）Git有着优雅的分支和合并功能；
	5）Git有着更强的撤销修改和修改版本历史的能力；
	6）Git速度更快，效率更好；
	
## 二、Git安装

    yum install git

	which -a git 查看git的安装位置
	git version	查看git的版本

	添加user.name和user.email
	git config --global user.name fyuan925
	git config --global user.email fyuan925@gmail.com

	得到user.name/user.email
    git config user.name
    git config user.email

    添加一个新的user.name
    git config --global --add user.name kgc

	得到属性的值
	git config user.name
	git config user.email

	得到全局所有属性的值
	git config --list --global

	删除一个属性，并且是指定属性名进行删除
    git config --global --unset user.name kgc
		
## 三、Git命令的基本使用：

-   git init  创建仓库
    添加一个readme.txt
    git status  查看当前版本库的状态
    git add filename    使用git add命令告诉git，把该文件添加到仓库
    git commit -m 'comment'  使用git commit命令告诉git，把文件提交到仓库

-   将文件提交到仓库，需要两步：  
    	1） add  
    	2） commit  
    git add 可以反复添加多个  
    git diff 查看修改的内容  
    git log  可以查看所有的提交历史记录  
    git log filename 仅查看指定文件名的提交历史记录  
    git log --pretty=oneline filename  
    d085ee8434392d2cf88b48592f29fbeefb0818f7  commit id（版本号） SHA-1 Hash计算出来一个16进制的值  

-   版本回退：  
    	前提：知道当前版本是哪个， HEAD表示当前版本  
    	回退到上一个版本： HEAD^   一个^就表是前一个版本， 如果N个前版本可以用HEAD~N  

    	回退：git reset --hard HEAD^  
    	回退之后你后悔了又想回到后退之前的那个版本： git reset --hard xxxxxxxxx  
    	xxxxxxxxx  前面可以通过 git log filename  

    	3commit   <== HEAD
    	2commit
    	1commit

    	执行了git reset --hard HEAD^之后
    	3commit
    	2commit  <== HEAD
    	1commit  

    git reset：版本穿梭， 可以使用git log查看提交历史，以便确定回退/穿梭到哪个版本  

    git reflog：查看命令历史，以便确定要回到未来/过去的哪个版本

    什么是修改：新增一行、修改几个字符、删除一行、新增文件、删除文件
    Git管理的是修改，而不是文件

-   撤销修改：
    	没有提交到暂存区时，其实就在工作区： git checkout -- file
    	已经提交到暂存区了： 分两步：1）git reset HEAD file 2）git checkout -- file

-   删除文件
    	手误删除，如何恢复： git checkout -- file
    	真删除版本库的文件：
    		1) git rm file
    		2) git commit -m 'xxx'

## 四、Git远程操作之添加远程库

-   生成ssh：ssh-keygen -t rsa -C 'kgc@gmail.com'
    在GitHub上设置ssh的公钥

-   与远程库建立连接
    git remote add origin git@github.com:fangyuan925/kgc_git.git
    git push -u origin master
    	git push 就是把当前分支(master)推送到远程
    	-u：第一次推送到master分支时，要设置了，后续就不需要再使用-u了

    git push  origin master

    执行get push时出现错误及解决办法：
    当执行命令git push -u origin master时报如下错误
    
    ![122](http://image.jumper-health.com/group2/M00/0E/F2/Ch3_3Vl4MAaANLncAABEzGuhCfQ231.png "12333")
    
    error: The requested URL returned error: 403 Forbidden while accessing https:// ...

    解决办法：git remote set-url origin https://fdd8@github.com/fdd8/kgc_git.git，即在网址中添加GitHub的用户名即可。
    再执行命令git push -u origin master时，就不会报错

-   远程库的两种方式
    1）先有本地仓库，后有远程仓库
    	git remote add origin git@github.com:fangyuan925/kgc_git.git
    	git push -u origin master
    	第一次使用-u，后面不再使用

    2）先有远程仓库，再clone到本地（最常见的，一般都是先在GitHub上创建仓库，然后开发人员再clone到本地）
    	git clone xxxxxx
    	git push -u origin master
    	第一次使用-u，后面不再使用

## 五、Git远程操作之添加远程库具体操作步骤

-   1、生成ssh，在GitHub上设置公钥  
    生成ssh：ssh-keygen -t rsa -C 'kgc@gmail.com'  
    进入ssh目录：cd ssh  
    将ssh目录下文件id_rsa.pub里的内容拷贝出来  

    在GitHub上设置ssh的公钥  
    1).进入GitHub主页，点击右上角settings  
    2).选择SSH and GPG keys进行公钥设置  
    3).点击右上角New SSH key新建一个ssh key，Title自定义，将CentOS中生成的公钥拷贝出来，粘贴到Key中，点击Add SSH key添加ssh key  
    4).输入GitHub的密码进行验证，点击Confirm password  

-   2、在GitHub上创建仓库  
    1).点击右上角+，选择New repository新建仓库  
    2).填写仓库名称，点击Create repository创建仓库  

-   3、与远程库建立连接  
    git remote add origin git@github.com:fangyuan925/kgc_git.git  
    git push -u origin master  
    	git push 就是把当前分支(master)推送到远程  
    	-u：第一次推送到master分支时，要设置了，后续就不需要再使用-u了  
    git push  origin master  


git 博客搭建 --> http://www.cnblogs.com/amoyzhu/p/6598850.html