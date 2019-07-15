import 'package:flutter/material.dart';
import 'basic.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Boost example',
        debugShowCheckedModeBanner: false,
        initialRoute: '/test',//调试的时候可以打开
        routes: {
          // '/': (context) => CommentSuggest({"Cookie":" _gm_token=7e48641558699683; sessionid=nb3ze4ur7ucosln8sd8pzwojddenv9ym; _gtid=a1bc0a387e1911e996b9525400fa516d4094"}),
          '/': (context) => BasicExample() ,
        },//调试的时候可以打开
        theme: new ThemeData(
        primaryColor: Colors.white,
        backgroundColor: Color(0xFFEFEFEF),
        accentColor: Color(0xFF888888),
        textTheme: TextTheme(
          //设置Material的默认字体样式
          body1: TextStyle(color: Color(0xFF888888), fontSize: 16.0),
        ),
        iconTheme: IconThemeData(
          color: Color(0xFFEFEFEF),
          size: 35.0,
        ),
      ),
    );
  }

}
