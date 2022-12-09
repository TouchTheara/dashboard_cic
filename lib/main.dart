import 'package:dashboard_cic/widget/custom_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:go_router/go_router.dart';

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
    return SingleChildScrollView(
        child: Column(
      children: [
        const Padding(
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Row(
            children: const [
              Expanded(
                  flex: 15,
                  child: CustomBox(
                    iconData: CupertinoIcons.ticket_fill,
                    subTitle: "UT",
                    title: "1,000,000",
                  )),
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: double.infinity,
                ),
              ),
              Expanded(
                flex: 15,
                child: CustomBox(),
              ),
            ],
          ),
        )
      ],
    ));
  }
}
