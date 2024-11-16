import 'package:developer_assignment/home/home_controller.dart';
import 'package:developer_assignment/home/home_repository.dart';
import 'package:developer_assignment/signup/signup_controller.dart';
import 'package:developer_assignment/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initControllers();
  runApp(const MyApp());
}

void initControllers() {
  Get.put(SignUpController());
  Get.put(HomeController());
  Get.put(HomeRepository());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SignUpScreen());
  }
}
