import 'package:get/get.dart';
import 'package:test_prep_2/modules/home_main/v/v_home_main_page.dart';

class GatewayController extends GetxController {
  Future<void> checkPoint() async {
    // final sp = SpService();

    // Read
    // String? token = sp.getString(SpKey.token);

    await Future.delayed(Duration(seconds: 2));

    // if (token.isNullOrEmpty) {
    //   Get.offAll(() => LoginPage());
    // } else {
    //   // call me api
    //   print('Token - ${token!}');
    //   final dataController = Get.find<DataController>();
    //   dataController.apiToken = token;
    //   await dataController.updateAll();
    Get.offAll(() => HomeMainPage());
    // }
  }
}
