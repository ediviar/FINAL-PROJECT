import 'package:final_project/pages/add_visitor.dart';
import 'package:final_project/pages/list_page.dart';
import 'package:final_project/pages/scan_page.dart';
import 'package:final_project/pages/setting_page.dart';
import 'package:final_project/pages/tamu_page.dart';
import 'package:final_project/templates/main_page.dart';
import 'package:final_project/templates/scanner.dart';
import 'package:final_project/templates/splash_screen.dart';

class MyRoutes {
  static String splashRoute = "/";
  static String mainRoute = "/main";
  static String addVisitorRoute = "/add";
  static String scanVisitorRoute = "/scan";
  static String tamuRoute = "/tamu";
  static String listVisitorRoute = "/list";
  static String settingRoute = "/setting";
  static String scannerRoute = "/scanner";
}

final routes = {
  MyRoutes.splashRoute: (context) => const SplashScreen(),
  MyRoutes.mainRoute: (context) => const MainPage(),
  MyRoutes.addVisitorRoute: (context) => const AddVisitor(),
  MyRoutes.scanVisitorRoute: (context) => const ScanPage(),
  MyRoutes.tamuRoute: (context) => const TamuPage(),
  MyRoutes.listVisitorRoute: (context) => const ListPage(),
  MyRoutes.settingRoute: (context) => const SettingPage(),
  MyRoutes.scannerRoute: (context) => const Scanner(),
};