import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation_drawer/NavigationPage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new CupertinoApp(
      title: 'UGoldi',
      theme: new CupertinoThemeData(
        textTheme: new CupertinoTextThemeData(primaryColor: Color(0xffcf201d)),
        primaryColor: Color(0xffcf201d),
      ),
      home: NavigationPage(0),
      // home: NavigationPage(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{

        '/Navigation': (BuildContext context) => new NavigationPage(0),

      },
    );
  }
}
