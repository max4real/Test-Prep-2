import 'package:get/get.dart';
import 'package:test_prep_2/modules/home_main/v/v_home_main_page.dart';

class GatewayController extends GetxController {
  Future<void> checkPoint() async {
    await Future.delayed(Duration(seconds: 2));

    Get.offAll(() => HomeMainPage());
  }
}
