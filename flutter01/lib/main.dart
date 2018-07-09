import 'dart:convert'; //集成了支持json、utf-8等数据格式的编码和解码器
import 'dart:io'; //集成了File, socket, HTTP等服务应用的IO库
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _ipAddress = 'Unknown'; //为啥要定义这个变量呢？为了后面只需要写一次setState()

  _getIPAddress() async {
    var url =
        'http://v.juhe.cn/weather/index?format=2&cityname=杭州&key=3097d233ca6350a50979a973bfd214ab';
    var httpClient = new HttpClient();

    String result;
    try {
      var request = await httpClient.postUrl(
          Uri.parse(url)); /*也可以使用httpClient.getUrl，注意根据接口要求改变两种请求方式的参数格式*/
      var response = await request.close();
      // if (response.statusCode == HttpStatus.OK) {
      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        // var data = JSON.decode(json);
        var data = jsonDecode(json);
        result = data['result']['data']['realtime']
            .toString(); //多维数组，请根据自己请求接口的结果对json数据结构进行拆解
      } else {
        result = 'Error get:\nHttp status ${response.statusCode}'; //连接错误提示
      }
    } catch (exception) {
      result = 'Failed getting data'; //代码执行异常，抛出错误信息
    }
    //如果当前控件已经被注销掉，则当前控件内置状态为mounted。
    /*由于是前面的HTTP异步请求，如果网络卡住，而当前控件因为其他原因注销掉了，
      此时不必调让代码走到后面的setState()方法，否则会报错，所以这里直接return，避免报错。*/
    if (!mounted) return;

    setState(() {
      _ipAddress = result; //显示请求结果
    });
  }

  @override
  Widget build(BuildContext context) {
    var spacer = new SizedBox(height: 32.0);

    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
              onPressed: _getIPAddress,
              child: new Text('获取天气预报'),
            ),
            new Text('$_ipAddress.'),
            spacer,
          ],
        ),
      ),
    );
  }
}
