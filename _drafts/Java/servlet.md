### 一、Servlet简介
- 1)Servlet是sun公司提供的一门用于开发动态web资源的技术。
- 2)Sun公司在其API中提供了一个servlet接口，用户若想用发一个动态web资源(即开发一个Java程序向浏览器输出数据)，需要完成以下2个步骤：
    - 1、编写一个Java类，实现servlet接口。
    - 2、把开发好的Java类部署到web服务器中。
- 3)按照一种约定俗成的称呼习惯，通常我们也把实现了servlet接口的java程序，称之为Servlet

### 二、Servlet的运行过程
- ①Web服务器首先检查是否已经装载并创建了该Servlet的实例对象。如果是，则直接执行第④步，否则，执行第②步。
- ②装载并创建该Servlet的一个实例对象。 
- ③调用Servlet实例对象的init()方法。
- ④创建一个用于封装HTTP请求消息的HttpServletRequest对象和一个代表HTTP响应消息的HttpServletResponse对象，然后调用Servlet的service()方法并将请求和响应对象作为参数传递进去。
- ⑤WEB应用程序被停止或重新启动之前，Servlet引擎将卸载Servlet，并在卸载之前调用Servlet的destroy()方法。

### Servlet-api
- javax.servlet.http.Cookie
- javax.servlet.http.HttpSession

- javax.servlet.http.HttpServlet
    用户通过继承HttpServlet类，重写doGet(),doPost()方法
- javax.servlet.http.ServletConfig
   - 1.在Servlet的配置文件web.xml中，可以使用一个或多个<init-param>标签为servlet配置一些初始化参数
```xml
    <servlet>
        <servlet-name>ServletConfigDemo1</servlet-name>
        <servlet-class>gacl.servlet.study.ServletConfigDemo1</servlet-class>
        <!--配置ServletConfigDemo1的初始化参数 -->
        <init-param>
            <param-name>name</param-name>
            <param-value>gacl</param-value>
        </init-param>
        <init-param>
            <param-name>password</param-name>
            <param-value>123</param-value>
        </init-param>
        <init-param>
            <param-name>charset</param-name>
            <param-value>UTF-8</param-value>
        </init-param>
    </servlet>
```
   - 2.通过ServletConfig获取Servlet的初始化参数
   
```java
public class ServletConfigDemo1 extends HttpServlet {
 
    /**
      * 定义ServletConfig对象来接收配置的初始化参数
      */
     private ServletConfig config;
     
     /**
      * 当servlet配置了初始化参数后，web容器在创建servlet实例对象时，
      * 会自动将这些初始化参数封装到ServletConfig对象中，并在调用servlet的init方法时，
      * 将ServletConfig对象传递给servlet。进而，程序员通过ServletConfig对象就可以
      * 得到当前servlet的初始化参数信息。
      */
     @Override
     public void init(ServletConfig config) throws ServletException {
         this.config = config;
     }
 
     public void doGet(HttpServletRequest request, HttpServletResponse response)
             throws ServletException, IOException {
         //获取在web.xml中配置的初始化参数
         String paramVal = this.config.getInitParameter("name");//获取指定的初始化参数
         response.getWriter().print(paramVal);
         
         response.getWriter().print("<hr/>");
         //获取所有的初始化参数
         Enumeration<String> e = config.getInitParameterNames();
         while(e.hasMoreElements()){
             String name = e.nextElement();
             String value = config.getInitParameter(name);
             response.getWriter().print(name + "=" + value + "<br/>");
         }
     }
 
     public void doPost(HttpServletRequest request, HttpServletResponse response)
             throws ServletException, IOException {
         this.doGet(request, response);
     }
}
```   
- javax.servlet.http.ServletContext
    - 1.WEB容器在启动时，它会为每个WEB应用程序都创建一个对应的ServletContext对象，它代表当前web应用。
    - 2.ServletConfig对象中维护了ServletContext对象的引用，开发人员在编写servlet时，可以通过ServletConfig.getServletContext方法获得ServletContext对象。
    - 3.由于一个WEB应用中的所有Servlet共享同一个ServletContext对象，因此Servlet对象之间可以通过ServletContext对象来实现通讯。ServletContext对象通常也被称之为context域对象。

- javax.servlet.http.HttpServletRequest
    
    
- javax.servlet.http.HttpServletResponse

- javax.servlet.http.Filter

- javax.servlet.http.
- javax.servlet.http.
- javax.servlet.http.
- javax.servlet.http.
- javax.servlet.http.
- javax.servlet.http.
- javax.servlet.http.
- javax.servlet.http.












博客地址
===
http://www.cnblogs.com/xdp-gacl/p/3760336.html