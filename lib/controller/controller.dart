import 'dart:async';
import 'dart:math';

import 'package:dashboard_cic/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyController extends GetxController {
  final chartDataList = <ChartData>[
    ChartData("Sale1", 0),
    ChartData("Sale2", 5000),
    ChartData("Sale3", 20000),
  ].obs;
  final percentList = <double>[1 - 0.1, 1 - 0.1].obs;
  final percentage = 0.0.obs;
  final uTAmount = 100.obs;
  final totalAmount = 0.00.obs;
  final inputAmount = 0.obs;
  final pricePerUT = 100.00.obs;
  final i = 3.obs;
  void onTapBuyNow(BuildContext context) {
    try {
      if (uTAmount.value >= inputAmount.value) {
        uTAmount.value = (uTAmount.value - inputAmount.value);

        // chartDataList.add(ChartData("Sale$i", inputAmount.value));

        totalAmount.value =
            totalAmount.value + (inputAmount.value * pricePerUT.value);
        i.value++;
        update();
      } else {
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text("Warning"),
            content: Text("No more UT left for your input"),
          ),
        );
      }
    } catch (e) {
      debugPrint('');
    }
  }

  late StreamSubscription sub;
  final Stream myStream = Stream.periodic(
      const Duration(
        seconds: 4,
      ), (int count) {
    return count;
  });
  Random random = Random();
  @override
  void onInit() {
    sub = myStream.listen((event) {
      debugPrint("EVENT: $event");
      if (uTAmount.value > 1) {
        inputAmount.value = random.nextInt(uTAmount.value - 1) + 1;
      } else if (uTAmount.value == 1) {
        inputAmount.value = 1;
      } else {
        inputAmount.value = 0;
      }

      debugPrint(
          'inputAmount.value=${inputAmount.value}     ,${uTAmount.value}');
      if (inputAmount.value > 0) {
        // if (event == 0) {
        //   event=event+3;
        // }else{
        //   event
        // }

        i.value++;
        debugPrint('i.value=${i.value}');
        // percentage.value = (inputAmount.value * 100) / 100;
        // debugPrint(" percentage.value=${percentage.value}");
        uTAmount.value = (uTAmount.value - inputAmount.value);

        var leftPercentage = uTAmount.value / 100;
        debugPrint(
            'leftPercentage=$leftPercentage===spendPercent====${100 - (leftPercentage * 100)}');

        // chartDataList
        //     .add(ChartData("Sale${i.value.toString()}", inputAmount.value));
        percentList.value = [];
        // if (leftPercentage != 0) {
        percentList.value = [leftPercentage - 0.1, leftPercentage - 0.1];
        // } else {
        //   percentList.value = [-0.1, -0.1];
        // }

        totalAmount.value = totalAmount.value + (inputAmount.value * 2);
        update();
      } else {
        // showDialog(
        //   context: NavigationService.navigatorKey.currentContext!,
        //   builder: (context) => const AlertDialog(
        //     title: Text("Warning"),
        //     content: Text("No more UT left for your input"),
        //   ),
        // );
        debugPrint('"No more UT left for your input"');
      }
    });
    super.onInit();
  }
}
