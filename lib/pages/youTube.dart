import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_youtube_downloader/flutter_youtube_downloader.dart';

class Youtube extends StatefulWidget {
  @override
  _YoutubeState createState() => _YoutubeState();
}

class _YoutubeState extends State<Youtube> {
  TextEditingController controller = TextEditingController();
  String link, error = "";

  Future<void> download() async {
    link = controller.text;
    if (link == "") {
      setState(() {
        error = "Please Provide an Input";
      });
    } else {
      setState(() {
        error = "";
      });
      try {
        final result = await FlutterYoutubeDownloader.downloadVideo(
            link, "Yfitube downloading", 18);
        print('Result is $result');
      } catch (e) {
        print('Error is $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  errorText: error,
                  border: OutlineInputBorder(),
                  hintText: 'Paste the link',
                ),
              ),
            ),
            ElevatedButton.icon(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.red[600]),
              ),
              onPressed: download,
              icon: Icon(Icons.download_outlined),
              label: Text("Download"),
            ),
          ],
        ),
      ),
    ));
  }
}
