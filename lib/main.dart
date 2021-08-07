import 'package:flutter/material.dart';
import 'package:yfitube/pages/facebook.dart';
import 'package:yfitube/pages/firstPage.dart';
import 'package:yfitube/pages/instagram.dart';
import 'package:yfitube/pages/youTube.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeLoader(),
      routes: {
        '/firstPage': (context) => FirstPage(),
        '/youtube': (context) => Youtube(),
        '/facebook': (context) => Facebook(),
        '/instagram': (context) => Instagram(),
      },
    );
  }
}

class HomeLoader extends StatefulWidget {
  @override
  _HomeLoaderState createState() => _HomeLoaderState();
}

class _HomeLoaderState extends State<HomeLoader> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),
        () => {Navigator.pushReplacementNamed(context, '/firstPage')});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        'assets/images/firstLoader.gif',
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ),
    );
  }
}
