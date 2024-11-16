import 'package:get/get.dart';

class SignUpController extends GetxController {
  RxBool isVisible = false.obs;

  void toggleVisibility() {
    isVisible.value = !isVisible.value;
  }
}
