import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routing_example/configs/app_page_routes.dart';
import 'package:routing_example/configs/shared_preference_helper.dart';
import 'package:routing_example/pages/dashboard/dashboard_page.dart';


///
/// Created by Sunil Kumar from Boiler plate
///
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferenceHelper storage = Get.put(SharedPreferenceHelper());
  await storage.initStorage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Routing',
        getPages: AppPageRoutes.routes,
        routeInformationParser: GetInformationParser(initialRoute: DashboardPage.routeName),
        themeMode: ThemeMode.light,
        );
  }
}

