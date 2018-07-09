### Expandedwidget

如果布局太大而不适合设备，则会在受影响的边缘出现警告条纹,如下图所示：

![Markdown](http://i1.bvimg.com/642728/1f6cd4d09f153492.png)

通过使用 Expanded widget，可以将 widget 的大小设置为适和行或列(参考 flex 布局)

```
body: Center(
       child: Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [
           new Expanded(
             child: new Image.asset('images/pic1.jpg'),
           ),
           new Expanded(
             child: new Image.asset('images/pic2.jpg'),
           ),
           new Expanded(
             child: new Image.asset('images/pic3.jpg'),
           ),
         ],
       ),
     ),
```
