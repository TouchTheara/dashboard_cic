// ignore_for_file: invalid_use_of_protected_member
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:intl/intl.dart';
import 'router/router.dart';

final c = NumberFormat("#,##0.00", "en_US");
final ut = NumberFormat("#,##0", "en_US");
void main() {
  AssetsAudioPlayer.setupNotificationsOpenAction((notification) {
    return true;
  });
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}
