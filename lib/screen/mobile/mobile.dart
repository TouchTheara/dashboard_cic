import 'package:dashboard_cic/screen/mobile/left_mobile.dart';
import 'package:dashboard_cic/screen/mobile/right_mobile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/controller.dart';

class Mobile extends StatelessWidget {
  const Mobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyController>(
        initState: (state) {},
        builder: (controller) {
          return Row(
            children: const [LeftMobile(), RightMobile()],
          );
        });
  }
}
