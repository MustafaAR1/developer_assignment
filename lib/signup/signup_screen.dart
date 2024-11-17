import 'package:developer_assignment/components/UIButton.dart';
import 'package:developer_assignment/components/UICommonCard.dart';
import 'package:developer_assignment/components/UIScaffold.dart';
import 'package:developer_assignment/components/UISpacer.dart';
import 'package:developer_assignment/components/UITextField.dart';
import 'package:developer_assignment/constants/asset_constants.dart';
import 'package:developer_assignment/constants/color_constants.dart';
import 'package:developer_assignment/constants/string_constants.dart';
import 'package:developer_assignment/home/home_screen.dart';
import 'package:developer_assignment/signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return UiScaffold(
      showBackground: true,
      body: UICommonCard(
        child: SignUpWidget(),
      ),
    );
  }
}

class SignUpWidget extends StatelessWidget {
  SignUpWidget({
    super.key,
  });

  final signUpController = Get.find<SignUpController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(26, 32, 26, 32),
      child: Column(
        children: [
          const Text(
            StringConstants.spiral,
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                StringConstants.login,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              UISpacer.spacerH20(),
              const UiTextField(
                title: StringConstants.email,
                labelText: 'John@gmail.com',
              ),
              UISpacer.spacerH16(),
              Obx(
                () => UiTextField(
                  isPassword: true,
                  showPrefixIcon: true,
                  isVisible: signUpController.isVisible.value,
                  onVisibilityToggle: signUpController.toggleVisibility,
                  title: StringConstants.password,
                  labelText: StringConstants.password,
                ),
              ), // Obx(() =>

              UISpacer.spacerH20(),
              UIButton(
                  buttonColor: ColorConstants.darkBlue,
                  textColor: Colors.white,
                  text: StringConstants.signIn,
                  onPressed: () {
                    Get.to(const HomeScreen());
                  }),
              UISpacer.spacerH20(),
              const Center(
                child: Text(
                  StringConstants.orChoose,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              UISpacer.spacerH16(),
              UIButton(
                  buttonColor: Colors.white,
                  prefixIcon: Icons.fingerprint,
                  text: StringConstants.signInWithPasskey,
                  onPressed: () {
                    Get.to(const HomeScreen());
                  }),
              UISpacer.spacerH24(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: UIButton(
                        buttonColor: Colors.white,
                        imageIcon: AssetConstants.google,
                        onPressed: () {
                          Get.to(const HomeScreen());
                        }),
                  ),
                  UISpacer.spacerW24(),
                  Expanded(
                    child: UIButton(
                        buttonColor: Colors.white,
                        imageIcon: AssetConstants.github,
                        onPressed: () {
                          Get.to(const HomeScreen());
                        }),
                  ),
                ],
              ),
              UISpacer.spacerH20(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    StringConstants.dontHaveAnAccount,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  Text(
                    StringConstants.registerForFree,
                    style:
                        TextStyle(color: ColorConstants.seaGreen, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
