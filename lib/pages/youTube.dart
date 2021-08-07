import 'package:flutter/material.dart';

class Youtube extends StatefulWidget {
  @override
  _YoutubeState createState() => _YoutubeState();
}

class _YoutubeState extends State<Youtube> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: Text("Youtube"),
    ));
  }
}
