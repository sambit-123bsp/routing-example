import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:routing_example/pages/authentication/controller/login_controller.dart';


class LoginPage extends GetResponsiveView<LoginController> {
  static const routeName = '/authentication';

  LoginPage({super.key});

  @override
  Widget? phone() {
    return SafeArea(
      child: Scaffold(
        body: Obx(
              ()=> Form(
            key: controller.formKey,
            autovalidateMode: controller.autoValidateMode.value,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 50),
              children: [
                const Text(
                  "Enter your registered email ID and \npassword.",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,fontStyle: FontStyle.italic),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: controller.email,
                  validator: (email){
                    if (email == null) return "required";
                    if (email.isEmpty) {
                      return "required";
                    } else if (!GetUtils.isEmail(email.trim())) {
                      return "invalid email id";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Enter email',
                    labelStyle:
                    const TextStyle(fontSize: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 1.2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 1.2,
                      ),
                    ),
                  ),
                ),
                TextFormField(
                  controller: controller.password,
                  validator: (data){
                    if (data == null) return "required";
                    if (data.toString().trim().isEmpty) return "required";
                    if (data is Iterable || data is Map) {
                      if (data.isEmpty) return "required";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: 'Enter password',
                    labelStyle:
                    const TextStyle(fontSize: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 1.2,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 1.2,
                      ),
                    ),
                  ),
                ).paddingOnly(top: 22, bottom: 22),
                ElevatedButton(
                  onPressed: controller.login,
                  child: const Text('Login'),
                )
              ],
            ),
          ),
        ),
      ),
    );

  }
  @override
  Widget desktop() {
    return Scaffold(
      body: Center(
        child: Obx(
              ()=> Form(
            key: controller.formKey,
            autovalidateMode: controller.autoValidateMode.value,
            child: Container(
              width: 500,
              height: 400,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: const Color(0xffffffff),
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.12),
                      blurRadius: 23,
                      offset: Offset(0, 8))
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    "Enter your registered email ID and password.",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600,fontStyle: FontStyle.italic),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    controller: controller.email,
                    validator: (email){
                      if (email == null) return "required";
                      if (email.isEmpty) {
                        return "required";
                      } else if (!GetUtils.isEmail(email.trim())) {
                        return "invalid email id";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Enter email',
                      labelStyle:
                      const TextStyle(fontSize: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 1.2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 1.2,
                        ),
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: controller.password,
                    validator: (data){
                      if (data == null) return "required";
                      if (data.toString().trim().isEmpty) return "required";
                      if (data is Iterable || data is Map) {
                        if (data.isEmpty) return "required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Enter password',
                      labelStyle:
                      const TextStyle(fontSize: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 1.2,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                          width: 1.2,
                        ),
                      ),
                    ),
                  ).paddingOnly(top: 22, bottom: 22),
                  ElevatedButton(
                    onPressed: controller.login,
                    child: const Text('Login'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LoginBinding extends Bindings {
  late LoginController loginController;

  @override
  void dependencies() {
    loginController = Get.put(LoginController());
  }
}