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

参考博客
===
http://www.cnblogs.com/xdp-gacl/p/3859416.html