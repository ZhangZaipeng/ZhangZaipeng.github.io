## Session与Cookie
### 一、Cookie机制 Session机制
    https://my.oschina.net/xianggao/blog/395675?fromerr=GC9KVenE
### 二、为什么有session 和 cookie
    Web应用程序是使用HTTP协议传输数据的。HTTP协议是无状态的协议。
    一旦数据交换完毕，客户端与服务器端的连接就会关闭，再次交换数据需要建立新的连接。
    这就意味着服务器无法从连接上跟踪会话。
    为了解决无法跟踪会话从而引入session 和 cookie。
    
### 三、什么是Cookie 
    由于HTTP是一种无状态的协议，服务器单从网络连接上无从知道客户身份。
    怎么办呢？就给客户端们颁发一个通行证吧，每人一个，无论谁访问都必须携带自己通行证。
    这样服务器就能从通行证上确认客户身份了。这就是Cookie的工作原理。
    
    Cookie实际上是一小段的文本信息。客户端请求服务器，如果服务器需要记录该用户状态，就使用response向客户端浏览器颁发一个Cookie。
    客户端浏览器会把Cookie保存起来。当浏览器再请求该网站时，浏览器把请求的网址连同该Cookie一同提交给服务器。
    服务器检查该Cookie，以此来辨认用户状态。服务器还可以根据需要修改Cookie的内容。

### 四、Java 如何操作 Cookie 
    java通过javax.servlet.http.Cookie类操作Cookie
    request.getCookie()获取客户端提交的所有Cookie（以Cookie[]数组形式返回）
- 1.Cookie的有效期: maxAge  
    - 单位秒。默认为–1
    - 如果为正数，则该Cookie在>maxAge秒之后失效。
    - 如果为负数，该Cookie为临时Cookie，关闭浏览器即失效，浏览器也不会以任何形式保存该Cookie。
    - 如果为0，表示删除该Cookie。
```text
    Cookie cookie = new Cookie("username","helloweenvsfei"); // 新建Cookie
    cookie.setMaxAge(Integer.MAX_VALUE); // 设置生命周期为MAX_VALUE
    response.addCookie(cookie); // 输出到客户端
```
- 2.Cookie的添加  
    - Cookie一旦创建，名称便不可更改,如果需要修改则需要覆盖。  
    注意：注意：修改、删除Cookie时，新建的Cookie除value、maxAge之外的所有属性，例如name、path、domain等，都要与原Cookie完全一样。否则，浏览器将视为两个不同的Cookie不予覆盖，导致修改、删除失败。
    
- 3.Cookie的域名
    - Cookie是不可跨域名的。
    如果设置为“.google.com”，则所有以“google.com”结尾的域名都可以访问该Cookie。注意第一个字符必须为“.”
```text
    Cookie cookie = new Cookie("time","20080808"); // 新建Cookie
    cookie.setDomain(".helloweenvsfei.com"); // 设置域名
    cookie.setPath("/"); // 设置路径
    cookie.setMaxAge(Integer.MAX_VALUE); // 设置有效期
    response.addCookie(cookie); // 输出到客户端
```

- 4.Cookie的路径
    - domain属性决定运行访问Cookie的域名，而path属性决定允许访问Cookie的路径
    - 设置为“/”时允许所有路径使用Cookie。path属性需要使用符号“/”结尾。
    - name相同但domain不同的两个Cookie也是两个不同的Cookie。
    注意：页面只能获取它属于的Path的Cookie。例如/session/test/a.jsp不能获取到路径为/session/abc/的Cookie。使用时一定要注意。
      - 1.domain表示的是cookie所在的域，默认为请求的地址，如网址为www.test.com/test/test.aspx，那么domain默认为www.test.com。而跨域访问，如域A为t1.test.com，域B为t2.test.com，那么在域A生产一个令域A和域B都能访问的cookie就要将该cookie的domain设置为.test.com；如果要在域A生产一个令域A不能访问而域B能访问的cookie就要将该cookie的domain设置为t2.test.com。
      - 2.path表示cookie所在的目录，默认为/，就是根目录。在同一个服务器上有目录如下：/test/,/test/cd/,/test/dd/，现设一个cookie1的path为/test/，cookie2的path为/test/cd/，那么test下的所有页面都可以访问到cookie1，而/test/和/test/dd/的子页面不能访问cookie2。这是因为cookie能让其path路径下的页面访问。
      - 3.浏览器会将domain和path都相同的cookie保存在一个文件里，cookie间用*隔开。
```text
    Cookie cookie = new Cookie("time","20080808"); // 新建Cookie
    cookie.setPath("/session/"); // 设置路径
    response.addCookie(cookie); // 输出到客户端
```
- 5.Cookie的安全属性
    - HTTP协议不仅是无状态的，而且是不安全的
```text
    Cookie cookie = new Cookie("time", "20080808"); // 新建Cookie
    cookie.setSecure(true); // 设置安全属性
    response.addCookie(cookie); // 输出到客户端
```     
- 6.实际应用：永久登陆

### 五、什么是Session
    Session是另一种记录客户状态的机制，不同的是Cookie保存在客户端浏览器中，而Session保存在服务器上。
    客户端浏览器访问服务器的时候，服务器把客户端信息以某种形式记录在服务器上。这就是Session。
    客户端浏览器再次访问时只需要从该Session中查找该客户的状态就可以了。
    
    如果说Cookie机制是通过检查客户身上的“通行证”来确定客户身份的话，那么Session机制就是通过检查服务器上的“客户明细表”来确认客户身份。
    Session相当于程序在服务器上建立的一份客户档案，客户来访的时候只需要查询客户档案表就可以了。

### 六、Java 如何操作 Session
- 1.void setAttribute(String attribute, Object value)：设置Session属性。value参数可以为任何Java Object。通常为Java Bean。value信息不宜过大 
- 2.String getAttribute(String attribute)：返回Session属性 
- 3.Enumeration getAttributeNames()：返回Session中存在的属性名 
- 4.void removeAttribute(String attribute)：移除Session属性 
- 5.String getId()：返回Session的ID。该ID由服务器自动创建，不会重复 
- 6.long getCreationTime()：返回Session的创建日期。返回类型为long，常被转化为Date类型，例如：Date createTime = new Date(session.getCreationTime()) 
- 7.long getLastAccessedTime()：返回Session的最后活跃时间。返回类型为long 
- 8.int getMaxInactiveInterval()：返回Session的超时时间。单位为秒。超过该时间没有访问，服务器认为该Session失效 
- 9.void setMaxInactiveInterval(int second)：设置Session的>超时时间。单位为秒 
- 10.void putValue(String attribute, Object value)：不推荐的方法。已经被setAttribute(String attribute, Object Value)替代 
- 11.Object getValue(String attribute)：不被推荐的方法。已经被getAttribute(String attr)替代 
- 12.boolean isNew()：返回该Session是否是>新创建的 void invalidate()：使该Session失效
