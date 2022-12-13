// ignore_for_file: invalid_use_of_protected_member
import 'dart:math';
import 'package:confetti/confetti.dart';

import 'package:dashboard_cic/controller/controller.dart';
import 'package:dashboard_cic/widget/custom_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:ripple_wave/ripple_wave.dart';

import 'package:responsive_framework/responsive_framework.dart';
// import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'router/router.dart';

final c = NumberFormat("#,##0.00", "en_US");
final ut = NumberFormat("#,##0", "en_US");
// final p = NumberFormat("#,##0", "en_US");
void main() {
  runApp(const MyApp());
  //testing git
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      key: NavigationService.navigatorKey,
      routerConfig: router,
      builder: (context, child) => ResponsiveWrapper.builder(child,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(480, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
          ],
          background: Container(color: const Color(0xFFF5F5F5))),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: LayoutBuilder(
        builder: (context, constraints) {
          return constraints.maxWidth > 800
              ? const DesktopAndTablet()
              : const Mobile();
        },
      ),
    );

    // This trailing comma makes auto-formatting nicer for build methods.
  }
}

class Mobile extends StatelessWidget {
  const Mobile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          Padding(
            padding: EdgeInsets.only(top: 20, left: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Live Dashboard",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
              child: CustomBox(
                iconData: CupertinoIcons.ticket_fill,
                subTitle: "UT",
                title: "1,000,000",
              )),
          Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: CustomBox()),
        ],
      ),
    );
  }
}

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

class DesktopAndTablet extends StatelessWidget {
  const DesktopAndTablet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final List<ChartData> chartData = [
    //   ChartData("Sale1", 10000),
    //   ChartData("Sale2", 50000),
    //   ChartData("Sale3", 100000),
    //   ChartData("Sale4", 500000),
    //   ChartData("Sale5", 1000000)
    // ];
    final controller = Get.put(MyController());
    final List<double> stops = <double>[];
    stops.add(0.0);
    stops.add(0.5);
    stops.add(1.0);
    final List<Color> color = <Color>[];
    color.add(Colors.pink[50]!);
    color.add(Colors.pink[200]!);
    color.add(Colors.pink);
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20, left: 20),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          const Text(
                            "Live Dashboard",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          RippleWave(
                            color: Colors.red[400]!,
                            childTween: Tween(begin: 0.1, end: 1),
                            duration: const Duration(milliseconds: 3000),
                            child: const Icon(
                              Icons.circle,
                              size: 35,
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, bottom: 40, top: 20),
                    child: Obx(
                      () => Row(
                        children: [
                          Expanded(
                              flex: 15,
                              child: CustomBox(
                                iconData: CupertinoIcons.ticket_fill,
                                subTitle: "UT",
                                title: ut.format(controller.uTAmount.value),
                              )),
                          const Expanded(
                            flex: 1,
                            child: SizedBox(
                              width: double.infinity,
                            ),
                          ),
                          Expanded(
                            flex: 15,
                            child: CustomBox(
                              title: c.format(controller.totalAmount.value),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GetBuilder<MyController>(
                    init: controller,
                    builder: (controllers) => SizedBox(
                      height: MediaQuery.of(context).size.height * 0.50,
                      width: MediaQuery.of(context).size.width * 0.2,
                      child: Stack(
                        children: [
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(14),
                              clipBehavior: Clip.hardEdge,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                width: MediaQuery.of(context).size.width * 0.2,
                                decoration: BoxDecoration(
                                    color: controller.percentage.value < 100
                                        ? Colors.grey[50]!
                                        : Colors.green[500]!,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey[50]!,
                                        blurRadius: 2.0,
                                        spreadRadius: -5.0,
                                        offset: const Offset(0.0, 8.0),
                                      ),
                                    ]),
                                child: Visibility(
                                  visible: controller.percentage.value < 100,
                                  child: WaveWidget(
                                    // heightPercentage: ,
                                    config: CustomConfig(
                                      colors: [
                                        Colors.green[200]!,
                                        Colors.green[300]!,
                                        Colors.green[400]!,
                                        Colors.green[500]!
                                      ],
                                      durations: [18000, 8000, 5000, 12000],
                                      heightPercentages:
                                          controllers.percentList,
                                    ),

                                    backgroundColor:
                                        controller.percentage.value == 100
                                            ? Colors.green
                                            : Colors.grey,
                                    size: const Size(
                                        double.infinity, double.infinity),
                                    isLoop: controller.percentage.value == 100
                                        ? false
                                        : true,
                                    waveAmplitude:
                                        controller.percentage.value > 99
                                            ? -2
                                            : 0,
                                    wavePhase: controller.percentage.value > 99
                                        ? -2
                                        : 0,
                                    waveFrequency:
                                        controller.percentage.value > 99
                                            ? -2
                                            : 4,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              color: Colors.blue[50],
                              width: MediaQuery.of(context).size.width * 0.06,
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              color: Colors.blue[50],
                              width: MediaQuery.of(context).size.width * 0.06,
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                                controller.percentage.value < 100
                                    ? "${controller.getNumber(controller.percentage.value, precision: 2).toString()}%"
                                    : "100%",
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: false,
                    child: Container(
                      child: GetBuilder<MyController>(
                        init: controller,
                        builder: (controller) => SfCartesianChart(
                          primaryXAxis: CategoryAxis(),
                          primaryYAxis: NumericAxis(),
                          enableAxisAnimation: true,
                          series: <ChartSeries>[
                            SplineAreaSeries<ChartData, String>(
                                // animationDelay: 3,
                                animationDuration: 3000,
                                color: Colors.pink,
                                dataSource: controller.chartDataList.value,
                                // Type of spline
                                splineType: SplineType.cardinal,
                                cardinalSplineTension: 0.9,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y,
                                gradient:
                                    LinearGradient(colors: color, stops: stops))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
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
            createParticlePath: drawStar, // define a custom shape/path.
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
    );
  }
}

class ChartData {
  final String x;
  final int y;
  ChartData(this.x, this.y);
}

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
