import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routing_example/configs/app_pages.dart';
import 'package:routing_example/middlewares/authcheck_middleWare.dart';
import 'package:routing_example/pages/dashboard/controller/dashboard_controller.dart';
import 'package:routing_example/pages/explore/explore_page.dart';
import 'package:routing_example/pages/home/home_page.dart';
import 'package:routing_example/pages/profile/profile_page.dart';
import 'package:routing_example/pages/setting/setting_page.dart';

class DashboardPage extends GetResponsiveView<DashboardController> {
  static const routeName = "/";

  DashboardPage({super.key});

  @override
  Widget? phone() {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Get.rootDelegate.toNamed(SettingsPage.routeName);
              },
            )
          ],
        ),
        body: controller.currentPage,
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.index.value,
          onTap: (index) {
            controller.index.value = index;
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.explore), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
          ],
          selectedItemColor: Colors.purple,
        ),
      ),
    );
  }

  @override
  Widget? desktop() {
    return Obx(
      () => Scaffold(
        body: Row(
          children: [
            Container(
              height: Get.height,
              width: 100,
              decoration: const BoxDecoration(
                  border: Border.fromBorderSide(
                      BorderSide(color: Colors.grey, width: 1))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: controller.index.value == 0
                        ? const Icon(
                            Icons.home,
                            color: Colors.purple,
                          )
                        : const Icon(
                            Icons.home,
                          ),
                    onPressed: () {
                      controller.index.value = 0;
                    },
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  IconButton(
                    icon: controller.index.value == 1
                        ? const Icon(
                            Icons.explore,
                            color: Colors.purple,
                          )
                        : const Icon(
                            Icons.explore,
                          ),
                    onPressed: () {
                      controller.index.value = 1;
                    },
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  IconButton(
                    icon: controller.index.value == 2
                        ? const Icon(
                            Icons.person,
                            color: Colors.purple,
                          )
                        : const Icon(
                            Icons.person,
                          ),
                    onPressed: () {
                      controller.index.value = 2;
                    },
                  ),
                ],
              ),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.settings),
                  onPressed: () {
                    Get.rootDelegate.toNamed(SettingsPage.routeName);
                  },
                ),
                Expanded(child: controller.currentPage)
              ],
            ))
          ],
        ),
      ),
    );
  }

  @override
  Widget? tablet() {
    return phone();
  }
}

class DashboardBinding extends Bindings {
  late DashboardController dashboardController;

  @override
  void dependencies() {
    dashboardController = Get.put(DashboardController());
  }
}
