import 'package:get/get.dart';
import 'package:routing_example/middlewares/authcheck_middleWare.dart';
import 'package:routing_example/pages/authentication/login_page.dart';
import 'package:routing_example/pages/dashboard/dashboard_page.dart';
import 'package:routing_example/pages/setting/setting_page.dart';


///
/// Created by Sunil Kumar from Boiler plate
///
class AppPageRoutes {
  static final routes = [
    GetPage(
        name: LoginPage.routeName,
        page: () => LoginPage(),
        binding: LoginBinding(),
        middlewares: [NoAuthCheckMiddleware()],
        participatesInRootNavigator: true,
        preventDuplicates: true),
    GetPage(
      name: DashboardPage.routeName,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
      transition: Transition.noTransition,
      middlewares: <GetMiddleware>[
        AuthCheckMiddleware(),
      ],
    ),
    // GetPage(
    //   name: HomePage.routeName,
    //   page: () => HomePage(),
    //   binding: DashboardBinding(),
    //   transition: Transition.noTransition,
    //   middlewares: <GetMiddleware>[
    //     AuthCheckMiddleware(),
    //   ],
    // ),
    // GetPage(
    //   name: Explore.routeName,
    //   page: () => Explore(),
    //   binding: DashboardBinding(),
    //   transition: Transition.noTransition,
    //   middlewares: <GetMiddleware>[
    //     AuthCheckMiddleware(),
    //   ],
    // ),
    // GetPage(
    //   name: ProfilePage.routeName,
    //   page: () => ProfilePage(),
    //   binding: DashboardBinding(),
    //   transition: Transition.noTransition,
    //   middlewares: <GetMiddleware>[
    //     AuthCheckMiddleware(),
    //   ],
    // ),
    GetPage(
      name: SettingsPage.routeName,
      page: () => SettingsPage(),
      middlewares: <GetMiddleware>[
        AuthCheckMiddleware(),
      ],
      preventDuplicates: true,
      participatesInRootNavigator: true,
    ),
  ];
}
