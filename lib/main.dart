import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_prep_2/modules/gateway/v/v_gateway.dart';
import 'package:test_prep_2/modules/search/m/hive/h_cache_result.dart';
import 'package:test_prep_2/utli/const/hive_box_name.dart';
import 'package:test_prep_2/utli/const/theme/app_theme.dart';
import 'package:test_prep_2/utli/controller/data_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CachedResultAdapter());
  await Hive.openBox<CachedResult>(HiveBoxName.searchCache);
  initializeController();
  runApp(const MainApp());
}

void initializeController() {
  Get.put(DataController(), permanent: true);
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    DataController dataController = Get.find();
    return GetMaterialApp(
      themeMode: dataController.appThemeMode,
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      home: GatewayPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
