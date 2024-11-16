import 'package:developer_assignment/components/UIScaffold.dart';
import 'package:developer_assignment/home/home_controller.dart';
import 'package:developer_assignment/models/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final  homecontroller = Get.find<HomeController>();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return UiScaffold(
      body: Column(
        children: [
          

        ],
      ),
    );
  }
}
