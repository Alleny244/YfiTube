import 'package:flutter/material.dart';
import 'package:flutter_insta/flutter_insta.dart';
import 'package:dio/dio.dart';
import 'dart:io';
import 'package:ext_storage/ext_storage.dart';
import 'package:permission_handler/permission_handler.dart';

class Instagram extends StatefulWidget {
  @override
  _InstagramState createState() => _InstagramState();
}

class _InstagramState extends State<Instagram> {
  TextEditingController controller = TextEditingController();
  FlutterInsta flutterInsta = new FlutterInsta();
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
      var status = await Permission.storage.request();
      print(status);
      if (status.isGranted) {
        try {
          String downloadLink = await flutterInsta
              .downloadReels("https://www.instagram.com/reel/CDlGkdZgB2y/");
          String path = await ExtStorage.getExternalStoragePublicDirectory(
              ExtStorage.DIRECTORY_DOWNLOADS);
          path += '/reel.mp4';
          print(path);

          var dio = Dio();
          final response = await dio.download(downloadLink, path);
          print(response.data.toString());
          // We didn't ask for permission yet or the permission has been denied before but not permanently.

        } catch (e) {
          print('Error is $e');
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: (Scaffold(
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
      )),
    );
  }
}
