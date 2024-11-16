import 'package:developer_assignment/home/home_repository.dart';
import 'package:developer_assignment/models/home.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
    final homeData = Rx<Home?>(null);
  final isLoading = Rx<bool>(false);
  final error = Rx<String?>(null);


  Future<void> getHomeData() async {
    isLoading.value = true;
     error.value = null;
    try {
      final homeData = await Get.find<HomeRepository>().getHomeData();
      this.homeData.value = homeData;
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

}