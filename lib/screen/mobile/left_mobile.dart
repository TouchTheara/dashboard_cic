import 'dart:math';

import 'package:dashboard_cic/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/battery_total_amount.dart';
import 'package:confetti/confetti.dart';

class LeftMobile extends StatelessWidget {
  const LeftMobile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyController());
    Path drawStar(Size size) {
      // Method to convert degree to radians
      double degToRad(double deg) => deg * (pi / 180.0);

      const numberOfPoints = 5;
      final halfWidth = size.width / 2;
      final externalRadius = halfWidth;
      final internalRadius = halfWidth / 2.5;
      final degreesPerStep = degToRad(360 / numberOfPoints);
      final halfDegreesPerStep = degreesPerStep / 2;
      final path = Path();
      final fullAngle = degToRad(360);
      path.moveTo(size.width, halfWidth);

      for (double step = 0; step < fullAngle; step += degreesPerStep) {
        path.lineTo(halfWidth + externalRadius * cos(step),
            halfWidth + externalRadius * sin(step));
        path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
            halfWidth + internalRadius * sin(step + halfDegreesPerStep));
      }
      path.close();
      return path;
    }

    return Container(
      color: const Color(0xfff2f2f2),
      width: Get.width * 0.4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
        child: ListView(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: Get.width * 0.06,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(2)),
                  padding: const EdgeInsets.all(7),
                  child: const Text(
                    "LIVE",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  "UNIT TRUST",
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Text(
              "SUBSCRIPTION",
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, left: 70),
              child: Stack(
                children: [
                  const Align(
                      alignment: Alignment.center, child: BatteryTotalAmount()),
                  Align(
                    alignment: Alignment.center,
                    child: ConfettiWidget(
                      confettiController: controller.controllerCenter,
                      blastDirectionality: BlastDirectionality
                          .explosive, // don't specify a direction, blast randomly
                      shouldLoop:
                          true, // start again as soon as the animation is finished
                      colors: const [
                        Colors.green,
                        Colors.pink,
                        Colors.orange,
                        Colors.purple
                      ], // manually specify the colors to be used
                      createParticlePath:
                          drawStar, // define a custom shape/path.
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ConfettiWidget(
                      confettiController: controller.controllerCenterRight,
                      blastDirection: pi, // radial value - LEFT
                      particleDrag: 0.05, // apply drag to the confetti
                      emissionFrequency: 0.05, // how often it should emit
                      numberOfParticles: 20, // number of particles to emit
                      gravity: 0.05, // gravity - or fall speed
                      shouldLoop: false,
                      colors: const [
                        Colors.green,
                        Colors.yellow,
                        Colors.pink
                      ], // manually specify the colors to be used
                      strokeWidth: 1,
                      strokeColor: Colors.white,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: ConfettiWidget(
                      confettiController: controller.controllerCenterLeft,
                      blastDirection: 0, // radial value - RIGHT
                      emissionFrequency: 0.6,
                      minimumSize: const Size(10,
                          10), // set the minimum potential size for the confetti (width, height)
                      maximumSize: const Size(50,
                          50), // set the maximum potential size for the confetti (width, height)
                      numberOfParticles: 1,
                      gravity: 0.1,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: ConfettiWidget(
                      confettiController: controller.controllerTopCenter,
                      blastDirection: pi / 2,
                      maxBlastForce: 5, // set a lower max blast force
                      minBlastForce: 2, // set a lower min blast force
                      emissionFrequency: 0.05,
                      numberOfParticles: 50, // a lot of particles at once
                      gravity: 1,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ConfettiWidget(
                      confettiController: controller.controllerBottomCenter,
                      blastDirection: -pi / 2,
                      emissionFrequency: 0.01,
                      numberOfParticles: 20,
                      maxBlastForce: 100,
                      minBlastForce: 80,
                      gravity: 0.3,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 20),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Image.asset(
                  'assets/images/qr.png',
                  height: Get.width * 0.15,
                  width: Get.width * 0.15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
