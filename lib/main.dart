// ignore_for_file: invalid_use_of_protected_member

import 'package:dashboard_cic/controller/controller.dart';
import 'package:dashboard_cic/widget/custom_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

import 'package:responsive_framework/responsive_framework.dart';
import 'package:go_router/go_router.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

final c = NumberFormat("#,##0.00", "en_US");
final ut = NumberFormat("#,##0", "en_US");
void main() {
  runApp(const MyApp());
  //testing git
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const DashboardScreen(
          title: "Dashboard",
        );
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      key: NavigationService.navigatorKey,
      routerConfig: _router,
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
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: Row(
                children: const [
                  Text(
                    "Live Dashboard",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.circle,
                    color: Colors.red,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: GetBuilder<MyController>(
              init: controller,
              builder: (controllers) => Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.height * 0.5,
                decoration: const BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Color(0xFF9B5DE5),
                    blurRadius: 2.0,
                    spreadRadius: -5.0,
                    offset: Offset(0.0, 8.0),
                  ),
                ]),
                child: WaveWidget(
                  config: CustomConfig(
                    colors: [
                      // Colors.indigo[400]!,
                      Colors.pink,
                      // Colors.indigo[200]!,
                      Colors.pink[200]!
                    ],
                    durations: [
                      18000,
                      8000,
                    ],
                    heightPercentages: controllers.percentList,
                  ),
                  backgroundColor: Colors.amber[300],
                  size: const Size(double.infinity, double.infinity),
                  waveAmplitude: 0,
                ),
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
                        gradient: LinearGradient(colors: color, stops: stops))
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
            child: Obx(() {
              debugPrint('${controller.inputAmount.value}');
              return Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextField(
                      onChanged: (v) {
                        try {
                          controller.inputAmount.value = int.parse(v);
                        } catch (e) {
                          debugPrint('e====$e');
                        }
                      },
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        labelStyle: const TextStyle(color: Colors.green),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.green, width: 2),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.green, width: 2),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.green, width: 2),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        labelText: 'Input UT Amount',
                        hintText: 'Enter UT amount..',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        controller.onTapBuyNow(context);
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(14)),
                        child: const Center(
                            child: Text(
                          "Buy Now",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      ),
                    ),
                  )
                ],
              );
            }),
          ),
        ],
      ),
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
