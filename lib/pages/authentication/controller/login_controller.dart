import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routing_example/configs/shared_preference_helper.dart';
import 'package:routing_example/pages/dashboard/dashboard_page.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late Rx<AutovalidateMode> autoValidateMode;

  @override
  void onInit() {
    autoValidateMode = Rx<AutovalidateMode>(AutovalidateMode.disabled);
    super.onInit();
  }
  void login() {
    final state = formKey.currentState;
    if (state == null) return;
    if (!state.validate()) {
      autoValidateMode.value = AutovalidateMode.always;
    } else {
      state.save();
      if (password.text == "Sambit@1234") {
        SharedPreferenceHelper storage = Get.find<SharedPreferenceHelper>();
        storage.storeAccessToken("12345");
        Get.rootDelegate.offNamed(DashboardPage.routeName);
      }
    }
  }
}
