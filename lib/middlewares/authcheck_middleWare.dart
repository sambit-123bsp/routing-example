import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routing_example/configs/app_storage.dart';

///
/// Created by Sunil Kumar from Boiler plate
///

class AuthCheckMiddleware extends GetMiddleware {
  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    final storage = Get.find<AppStorage>();
    final token = storage.accessToken;
    if (token != null) {
      return await super.redirectDelegate(route);
    } else {
      return GetNavConfig.fromRoute("/authentication");
    }

  }
}
class NoAuthCheckMiddleware extends GetMiddleware {
  @override
  Future<GetNavConfig?> redirectDelegate(GetNavConfig route) async {
    final storage = Get.find<AppStorage>();
    final token = storage.accessToken;
    if (token != null) {
      return GetNavConfig.fromRoute("/dashboard");
    } else {
      return await super.redirectDelegate(route);
    }

  }
}


