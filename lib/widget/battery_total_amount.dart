import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/controller.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class BatteryTotalAmount extends StatelessWidget {
  const BatteryTotalAmount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyController>(
      builder: (controller) => Container(
        color: Colors.transparent,
        height: MediaQuery.of(context).size.height * 0.50,
        width: MediaQuery.of(context).size.width * 0.16,
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(100),
                      topRight: Radius.circular(100),
                    ),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.02,
                      width: MediaQuery.of(context).size.width * 0.05,
                      decoration: BoxDecoration(
                        color: controller.percentage.value < 100
                            ? Colors.grey
                            : const Color(0xff1050a4),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[50]!,
                            blurRadius: 2.0,
                            spreadRadius: -5.0,
                            offset: const Offset(0.0, 8.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Stack(
                    children: [
                      Positioned(
                        // right: 10,
                        // bottom: 10,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.48 - 8,
                          width: MediaQuery.of(context).size.width * 0.2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.transparent,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(3, 3))
                              ]),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        clipBehavior: Clip.hardEdge,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.48 - 8,
                          width: MediaQuery.of(context).size.width * 0.2,
                          decoration: BoxDecoration(
                            color: controller.percentage.value < 100
                                ? Colors.grey[50]!
                                : Colors.blue[500]!,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[50]!,
                                blurRadius: 2.0,
                                spreadRadius: -5.0,
                                offset: const Offset(0.0, 8.0),
                              ),
                            ],
                          ),
                          child: Visibility(
                            visible: controller.percentage.value < 100,
                            child: WaveWidget(
                              // heightPercentage: ,
                              config: CustomConfig(
                                colors: [
                                  Colors.blue[200]!,
                                  Colors.blue[300]!,
                                  Colors.blue[400]!,
                                  Colors.blue[500]!
                                ],
                                durations: [18000, 8000, 5000, 12000],
                                heightPercentages: controller.percentList,
                              ),

                              backgroundColor:
                                  controller.percentage.value == 100
                                      ? Colors.blue
                                      : Colors.grey,
                              size:
                                  const Size(double.infinity, double.infinity),
                              isLoop: controller.percentage.value == 100
                                  ? false
                                  : true,
                              waveAmplitude:
                                  controller.percentage.value > 99 ? -2 : 0,
                              wavePhase:
                                  controller.percentage.value > 99 ? -2 : 0,
                              waveFrequency:
                                  controller.percentage.value > 99 ? -2 : 4,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                    controller.percentage.value < 100
                        ? "${controller.getNumber(controller.percentage.value, precision: 2).toString()}%"
                        : "100%",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: controller.percentage.value == 100 ? 30 : 20,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
