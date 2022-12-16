import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/controller.dart';
import 'left_desktop.dart';
import 'right_desktop.dart';

class DesktopAndTablet extends StatelessWidget {
  DesktopAndTablet({
    Key? key,
  }) : super(key: key);

  final controller = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyController>(initState: (state) {
      debugPrint("@@@@@@@@@@@@@@@@@${controller.percentage.value}");
    }, builder: (controller) {
      return Row(
        children: const [LeftDesktop(), RightDesktop()],
      );
    });
  }
}

class ChartData {
  final String x;
  final int y;
  ChartData(this.x, this.y);
}
