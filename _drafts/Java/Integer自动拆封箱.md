Integer拆封箱
===
其实Integer与int类型的赋值与比较最关键的一点就是：这两个变量的类型不同。
Integer是引用类型，int是原生数据类型。

我们分四种情况来讨论：
- 1） Integer与int类型的赋值
    - a.把Integer类型赋值给int类型。此时，int类型变量的值会自动装箱成Integer类型，然后赋给Integer类型的引用，这里底层就是通过调用valueOf()这个方法来实现所谓的装箱的。
    - b.把int类型赋值给Integer类型。此时，Integer类型变量的值会自动拆箱成int类型，然后赋给int类型的变量，这里底层则是通过调用intValue()方法来实现所谓的拆箱的。
- 2） Integer与int类型的比较
    这里就无所谓是谁与谁比较了，Integer == int与int == Integer的效果是一样的，都会把Integer类型变量拆箱成int类型，然后进行比较，相等则返回true，否则返回false。同样，拆箱调用的还是intValue()方法。
- 3） Integer之间的比较
    这个就相对简单了，直接把两个引用的值（即是存储目标数据的那个地址）进行比较就行了，不用再拆箱、装箱什么的。
- 4） int之间的比较
    这个也一样，直接把两个变量的值进行比较。

<font color=red>值得注意的是：</font>
- 1）对Integer对象，JVM会自动缓存-128~127范围内的值，所以所有在这个范围内的值相等的Integer对象都会共用一块内存，而不会开辟多个；
- 2）超出这个范围内的值对应的Integer对象有多少个就开辟多少个内存。

```java
    public class T {
        public static void main(String[] args){
            Integer i01 = 59;
            int i02 = 59;
            Integer i03 =Integer.valueOf(59);   
            Integer i04 = new Integer(59);      
    
            System.out.println(i01 == i02);     // --> true
            System.out.println(i01 == i03);     // --> true
            System.out.println(i01 == i04);     // --> false
    
            System.out.println(i02 == i03);     // --> true
            System.out.println(i02 == i04);     // --> true
            
            System.out.println(i03 == i04);     // --> false
        }
    }
```
