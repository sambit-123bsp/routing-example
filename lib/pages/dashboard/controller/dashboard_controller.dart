import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:routing_example/pages/explore/explore_page.dart';
import 'package:routing_example/pages/home/home_page.dart';
import 'package:routing_example/pages/profile/profile_page.dart';

class DashboardController extends GetxController {
  RxInt index = RxInt(0);
  List<Widget> pages = [HomePage(),Explore(),ProfilePage()];
  get currentPage => pages[index.value];
}
