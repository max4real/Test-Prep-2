import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_prep_2/modules/gateway/v/v_gateway.dart';
import 'package:test_prep_2/modules/search/m/hive/h_cache_result.dart';
import 'package:test_prep_2/utli/const/hive_box_name.dart';
import 'package:test_prep_2/utli/const/theme/app_theme.dart';
import 'package:test_prep_2/utli/controller/data_controller.dart';
import 'package:test_prep_2/utli/services/sp_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeController();
  await SpService().init();
  await Hive.initFlutter();
  Hive.registerAdapter(CachedResultAdapter());
  await Hive.openBox<CachedResult>(HiveBoxName.searchCache);
  await cleanExpiredCache();
  runApp(const MainApp());
}

void initializeController() {
  Get.put(DataController(), permanent: true);
}

Future<void> cleanExpiredCache() async {
  final now = DateTime.now();
  final cacheBox = Hive.box<CachedResult>(HiveBoxName.searchCache);

  for (final key in cacheBox.keys) {
    final cached = cacheBox.get(key);
    if (cached != null &&
        now.difference(cached.timestamp) >= Duration(minutes: 30)) {
      await cacheBox.delete(key);
    }
  }
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
