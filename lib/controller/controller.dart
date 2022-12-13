import 'dart:async';
import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:dashboard_cic/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyController extends GetxController {
  final chartDataList = <ChartData>[
    ChartData("Sale1", 0),
    ChartData("Sale2", 5000),
    ChartData("Sale3", 20000),
  ].obs;
  final percentList = <double>[1 - 0.1, 1 - 0.1, 1 - 0.1, 1 - 0.1].obs;
  final spendPercent = (1 - 0.1).obs;
  final percentage = 0.0.obs;
  final uTAmount = 1000000.obs;
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
  late ConfettiController controllerCenter;
  late ConfettiController controllerCenterRight;
  late ConfettiController controllerCenterLeft;
  late ConfettiController controllerTopCenter;
  late ConfettiController controllerBottomCenter;
  @override
  void dispose() {
    controllerCenter.dispose();
    controllerCenterRight.dispose();
    controllerCenterLeft.dispose();
    controllerTopCenter.dispose();
    controllerBottomCenter.dispose();
    super.dispose();
  }

  @override
  void onInit() {
    controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    controllerCenterRight =
        ConfettiController(duration: const Duration(seconds: 10));
    controllerCenterLeft =
        ConfettiController(duration: const Duration(seconds: 10));
    controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    controllerBottomCenter =
        ConfettiController(duration: const Duration(seconds: 10));
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
        i.value++;
        debugPrint('i.value=${i.value}');

        uTAmount.value = (uTAmount.value - inputAmount.value);

        var leftPercentage = uTAmount.value / 1000000;

        debugPrint(
            'leftPercentage=$leftPercentage===spendPercent====${100 - (leftPercentage * 100)}');
        percentage.value = 100 - (leftPercentage * 100);
        // for (var i = percentList.value[0]; i > ;i=i-0.1) {

        // }

        awaitFuc(percentList.value[0], leftPercentage);

        // }

        if (percentage.value == 100) {
          controllerCenter.play();
          controllerCenterRight.play();
          controllerBottomCenter.play();
          controllerCenterLeft.play();
          controllerTopCenter.play();
        }

        totalAmount.value = totalAmount.value + (inputAmount.value * 2);
        update();
      }
    });

    super.onInit();
  }

  double getNumber(double input, {int precision = 2}) {
    var num = 0.00;
    try {
      num = double.parse(
          '$input'.substring(0, '$input'.indexOf('.') + precision + 1));
    } catch (e) {
      debugPrint('e=====$e');
      num = 0.00;
    }
    return num;
  }

  awaitFuc(double currentPercentage, double leftPercentage) async {
    for (var i = currentPercentage;
        i > leftPercentage - 0.1;
        i = i - (leftPercentage / 10)) {
      await Future.delayed(
        const Duration(milliseconds: 15),
        () {},
      );
      percentList.value = [
        (i + (leftPercentage / 5)),
        (i + (leftPercentage / 10)),
        (i + (leftPercentage / 10)),
        (i + (leftPercentage / 10))
      ];
      update();
      debugPrint("i=$i");
    }
  }
}
