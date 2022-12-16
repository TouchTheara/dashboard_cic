import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';
import 'desktop_tablet/desktop_tablet.dart';
import 'mobile/mobile.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key, required this.title});

  final String title;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with WidgetsBindingObserver {
  final controller = Get.put(MyController());
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    final isBackGound = state == AppLifecycleState.paused;
    final isdetached = state == AppLifecycleState.detached;
    final isresume = state == AppLifecycleState.resumed;
    if (isBackGound || isdetached) {
      controller.assetsAudioPlayer!.setVolume(2);
      controller.assetsAudioPlayer!.play();
    }
    if (isresume) {
      controller.assetsAudioPlayer!.setVolume(2);
      controller.assetsAudioPlayer!.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: LayoutBuilder(
        builder: (context, constraints) {
          return constraints.maxWidth > 800
              ? DesktopAndTablet()
              : const Mobile();
        },
      ),
    );
  }
}
