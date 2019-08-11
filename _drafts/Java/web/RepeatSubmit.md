### 重复提交解决方案

1.如果是页面可以通过js来防止
```javascript
    var isCommitted = false;//表单是否已经提交标识，默认为false
    function dosubmit(){
        if(isCommitted==false){
            isCommitted = true;//提交表单后，将表单是否已经提交标识设置为true
            return true;//返回true让表单正常提交
        }else{
            return false;//返回false那么表单将不提交
        }
    }
```

2.可以把提交按钮 disable掉

3.session防止重复提交
具体的做法：在服务器端生成一个唯一的随机标识号，专业术语称为Token(令牌)，同时在当前用户的Session域中保存这个Token。  
然后将Token发送到客户端的Form表单中，在Form表单中使用隐藏域来存储这个Token，表单提交的时候连同这个Token一起提交到服务器端，
然后在服务器端判断客户端提交上来的Token与服务器端生成的Token是否一致，如果不一致，那就是重复提交了，此时服务器端就可以不处理重复提交的表单。
如果相同则处理表单提交，处理完后清除当前用户的Session域中存储的标识号。

核心代码
```java
public class DoFormServlet extends HttpServlet {
    
    public void doGet(HttpServletRequest request, HttpServletResponse response)
                 throws ServletException, IOException {
 
             boolean b = isRepeatSubmit(request);//判断用户是否是重复提交
             if(b==true){
                 System.out.println("请不要重复提交");
                 return;
             }
             request.getSession().removeAttribute("token");//移除session中的token
            System.out.println("处理用户提交请求！！");
    }
         
    /**
    * 判断客户端提交上来的令牌和服务器端生成的令牌是否一致
    * @param request
    * @return 
    *         true 用户重复提交了表单 
    *         false 用户没有重复提交表单
    */
    private boolean isRepeatSubmit(HttpServletRequest request) {
         String client_token = request.getParameter("token");
         //1、如果用户提交的表单数据中没有token，则用户是重复提交了表单
         if(client_token==null){
             return true;
         }
         //取出存储在Session中的token
         String server_token = (String) request.getSession().getAttribute("token");
         //2、如果当前用户的Session中不存在Token(令牌)，则用户是重复提交了表单
         if(server_token==null){
             return true;
         }
         //3、存储在Session中的Token(令牌)与表单提交的Token(令牌)不同，则用户是重复提交了表单
         if(!client_token.equals(server_token)){
             return true;
        }
         
         return false;
     }
 
    public void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException {
        doGet(request, response);
    }
}
```

参考博客
===
http://www.cnblogs.com/xdp-gacl/p/3859416.html