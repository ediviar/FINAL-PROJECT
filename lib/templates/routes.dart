import 'package:final_project/pages/scan_page.dart';
import 'package:final_project/pages/setting_page.dart';
import 'package:final_project/pages/tamu_page.dart';
import 'package:final_project/templates/main_page.dart';
import 'package:final_project/templates/splash_screen.dart';

class MyRoutes {
  static String splashRoute = "/";
  static String mainRoute = "/main";
  static String scanRoute = "/scan";
  static String tamuRoute = "/tamu";
  static String listRoute = "/list";
  static String settingRoute = "/setting";
}

final routes = {
  MyRoutes.splashRoute: (context) => const SplashScreen(),
  MyRoutes.mainRoute: (context) => const MainPage(),
  MyRoutes.scanRoute: (context) => const ScanPage(),
  MyRoutes.tamuRoute: (context) => const TamuPage(),
  MyRoutes.listRoute: (context) => const TamuPage(),
  MyRoutes.settingRoute: (context) => const SettingPage(),
};