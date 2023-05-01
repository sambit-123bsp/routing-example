import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routing_example/configs/shared_preference_helper.dart';
import 'package:routing_example/pages/authentication/login_page.dart';

class ProfilePage extends GetResponsiveView {
  ProfilePage({super.key});

  static const routeName = "/profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundColor: Colors.black,
              ).paddingOnly(top: 24),
              const Text('Name : Sambit Kumar Parida',style: TextStyle(fontSize: 18),).paddingOnly(top: 16),
              const Text('Phone Number: 9999999999',style: TextStyle(fontSize: 18)).paddingOnly(top: 16),
              const Text('Email Address: sambit@mail.com',style: TextStyle(fontSize: 18)).paddingOnly(top: 16,bottom: 16),
              TextButton(onPressed: (){
                Get.dialog(AlertDialog(
                  title: const Text('Logout'),
                  content: const Text('Are you sure want to logout?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: const Text('cancel'),
                    ),
                    TextButton(onPressed: () {
                      SharedPreferenceHelper storage = Get.find<SharedPreferenceHelper>();
                      storage.logout();
                      Get.rootDelegate.offAndToNamed(LoginPage.routeName);
                    }, child: const Text('ok'))
                  ],
                ));
              }, child: const Text('Logout'))
            ],
          ),
        ),
      ),
    );
  }
}
