## Git分支
- 分支：Git会串成一条时间线，这条时间线就是分支， 默认就是master HEAD并不是指向提交，而是指向master
```text
    v1  ==>  v2  ==> v3
                     |
                    master
                     |
                    HEAD
    
    
    v1  ==>  v2  ==> v3  ==> v4
                              |
                            master
                              |
                            HEAD
    
                                          master
                                            |
    v1  ==>  v2  ==> v3  ==> v4 ==> v5  ==> v6
                                            |
                                            dev
                                            |
                                            HEAD
```

- 查看分支：git branch  
    * master  
    *表示你当前所处的branch是哪个  

- 切换分支： git checkout xxxx  
    git checkout -b dev  
    -b表示创建并且切换
    
- 合并分支：git merge dev  
    把dev分支合并到当前分支，因为我们当前分支是master，所以就是将dev合并到master

- 删除分支： git branch -d dev


- **解决冲突**：  
    feature1 :  a.txt  AND simple  
    master   :  a.txt  &   simple 

```text
                                         master
                                           |
   v1  ==>  v2  ==> v3  ==> v4 ==> v5  ==> v6
                                           |
                                        feature1  
                                           |
                                          HEAD


    在master和分支上分别对a.txt做了不同修改之后，合并分支出现以下错误：
    git merge feature1
    Auto-merging a.txt
    CONFLICT (content): Merge conflict in a.txt
    Automatic merge failed; fix conflicts and then commit the result.
    
    cat a.txt 
    a.txt
    
    
    在master和分支上分别对a.txt做了不同修改之后，a.txt的内容如下：
    <<<<<<< HEAD
    Creating a new branch is quick & simple.
    =======
    Creating a new branch is quick AND simple.
    .>>>>>>> feature1
    
    
    <<<<<<<.   =======  >>>>>>> 标记出不同分支的内容
    
    git log --graph  --pretty=oneline --abbrev-commit
    当Git无法自动合并分支时，就必须首先解决冲突，再提交，最后再merge
    可以使用git log --graph命令可以看到分支合并图。
```

- 分支管理策略：  
    - 1）master分支： 代码是稳定的，平时不能在上面干活的，仅仅是用来发布新版本用
    - 2）dev分支：是不稳定的，bug、feature可以创建新的分支进行开发，最后再合并到master即可
	bug-id 10000    bug-10000


## 标签操作总结：
    - 新建一个标签： git tag <name> ，默认是HEAD，也可以指定一个commit id  
        git tag -a <name> -m 'xxxxxx'指定标签信息
    
    - 查看所有标签： git tag 
    
    - 删除标签：git tag -d v0.1  
        如果tag已经推送到远程，要删除远程标签就需要麻烦一点，分2步：
        - 1）删除本地tag:  git tag -d v0.9
        - 2）git push origin :refs/tags/v0.9
    
    - 提交标签到GitHub：git push origin v1.0

## Git控制台颜色设置
    git config --global color.diff auto
    git config --global color.status auto
    git config --global color.branch auto
    
    颜色设置关闭
    git config --global color.status false


## 忽略某些特殊文件不提交
    - 1）只需要在git项目的根目录下创建一个.gitignore
    - 2）把需要提交的文件或者目录写到.gitignore
    - 3）如果你真正想提交的文件已经被包含在.gitignore里面了，那么就需要使用-f进行强制提交


## Git配置别名：
    
    git config --global alias.st status
    git config --global alias.ci commit
    git config --global alias.br branch
    git config --global alias.co checkout

    配置别名完成之后在什么地方能看到呢？
    默认在当前用户的根目录下有一个.gitconfig
    cat .gitconfig 
    [user]
        email = fyuan925@gmail.com
        name = fyuan925
    [color]
        diff = auto
        status = false
        branch = auto
    [alias]
        st = status
        ci = commit
        br = branch
        co = checkout
	
## <font color=red>知识点总结</font>  
- <font color=blue>分支管理</font>  
    场景描述：开发一个新功能，预计一周完成，你三天开发好了70%的代码，但是还没连调，如果此时立刻提交，由于代码还没写完，不完整的代码库会导致别人不能干活。如果等代码全部写完再一次提交，又存在丢失每天进度的巨大风险。
    分支的诞生：自己在自己的分支上开发，和别人互不影响，开发完成后再合并到master上去即可。

    查看分支：git branch
    创建分支：git branch <name>
    切换分支：git checkout <name>
    创建&切换分支：git checkout -b <name>
    合并某分支到当前分支：git merge <name>
    删除分支：git branch -d <name>

- 解决冲突时查看分支合并图：git log --graph  
    Bug分支  
    Feature分支

- <font color=blue>标签管理</font>  
    什么是标签（tag）：是版本库的一个快照
    发布一个新版本时，通常先在版本库中打一个标签，无论在将来的时候，取出某个标签的版本即可

    创建标签:git tag <tagname>
    查看所有标签：git tag
    创建带有说明的标签：git tag -a <tagname> -m <desc>
    查看标签的说明：git show <tagname>
    删除标签：git tag -d <tagname>

    推送一个本地标签：git push origin <tagname>
    推送全部未推送的本地标签：git push origin --tags
    删除一个本地标签：git tag -d <tagname>
    删除一个远程标签：git push origin:refs/tags/<tagname>


- <font color=blue>多人协作</font>  
    开源项目肯定都是很多人参与到社区中，通过协作完成  
    多人协作常用操作  
    克隆远程仓库：git clone  
    查看远程信息：git remove (-v)  
    解决冲突问题  
    推送分支：git push origin <branch-name>  
    创建Pull Request  

- <font color=blue>GitHub常用操作介绍</font>
    可以将个人的开源项目放在GitHub中，既可以让别人参与你的项目，你也可以参与到别人的开源项目中去
    希望大家能真正参与带自己感兴趣的开源项目中去，做到从开源中来，然后回馈到开源中去
    GitHub常用操作：clone、fork、watch、star

- <font color=blue>GitHub常用操作之博客</font>
    相信很多人都有写博客的习惯，免费和收费的都有
    近些年，一些程序员开始在github网站上搭建blog。他们既拥有绝对管理权，又享受github带来的便利----不管何时何地，只要向主机提交commit，就能发布新文章
    更妙的是，这一切还是免费的，github提供无限流量，世界各地都能访问
    使用GitHub搭建博客

- <font color=blue>GitHub常用操作之组织</font>
    除了个人账户外，GitHub还提供被称为组织(Organizations)的账户
    组织账户和个人账户一样都有一个用于存放所拥有项目的命名空间，但是许多其他的东西都是不同的
    组织账户代表了一组共同拥有多个项目的人，同时也提供一些人具用于对成员进行分组管理
    通常，这种账户被用于开源群组（例如：“perl”或者“rails”），或者公司（例如：“google”或者“twitter”）
    通过GitHub创建组织


- Git其他功能介绍
- Git颜色设置  
    设置颜色：git config --global color.diff auto
              git config --global color.status auto
              git config --global color.branch auto
    颜色设置关闭：git config --global color.status false
- 忽略特殊文件 
    1）只需要在git项目的根目录下创建一个.gitignore  
    2) 把需要提交的文件或者目录写到.gitignore  
    3）如果你真正想提交的文件已经被包含在.gitignore里面了，那么就需要使用-f进行强制提交  
- 设置常用命名别名     
    git config --global alias.st status	