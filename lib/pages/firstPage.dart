import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yfitube/pages/facebook.dart';
import 'package:yfitube/pages/instagram.dart';
import 'package:yfitube/pages/youTube.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: TabBar(
          controller: tabController,
          tabs: [
            Tab(child: SvgPicture.asset('assets/images/youtube.svg')),
            Tab(child: SvgPicture.asset('assets/images/instagram.svg')),
            Tab(child: SvgPicture.asset('assets/images/facebook.svg')),
          ],
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            Youtube(),
            Instagram(),
            Facebook(),
          ],
        ),
      ),
    );
  }
}
