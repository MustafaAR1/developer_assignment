import 'package:developer_assignment/mockData/home.dart';
import 'package:developer_assignment/models/home.dart';

class HomeRepository {
  Future<Home> getHomeData() async {
     await Future.delayed(const Duration(seconds: 2));
      return Home.fromJson(MockData.home['home']);

  }
}
