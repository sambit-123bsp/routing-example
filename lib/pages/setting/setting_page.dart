import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends GetResponsiveView {
  static const routeName = '/settings';

  SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Container(),
    );
  }
}
