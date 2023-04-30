import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetResponsiveView {
  HomePage({super.key});

  static const routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      'Home',
      style: TextStyle(color: Colors.black, fontSize: 24),
    ));
  }
}
