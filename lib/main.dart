import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '/config/const/theme_consts.dart';
import 'config/local_storage/local_storage.dart';
import '/config/routes/routes_name.dart';
import 'config/routes/controller_binding.dart';
import 'config/routes/routes_binding.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  await initialiseService();
  runApp(const MyApp());
}

Future<void> initialiseService() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.getInstance();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: ThemeConsts.kAppName,
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      initialBinding: ControllerBinding(),
      initialRoute: RoutesName.kPosts,
      getPages: GetRoutes().generateRoutes(),
      theme: ThemeStyle.themeData(),
    );
  }
}
