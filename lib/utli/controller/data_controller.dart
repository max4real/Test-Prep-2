import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:test_prep_2/modules/search/m/hive/h_cache_result.dart';
import 'package:test_prep_2/utli/const/hive_box_name.dart';

class DataController extends GetxController {
  final cacheDuration = Duration(minutes: 30);
  ThemeMode appThemeMode = ThemeMode.dark;
  String accessToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1NjM0NjA3YjlmMjhmNWQwZTczMjZlZTkzYjQxZTg5ZCIsIm5iZiI6MTc2MDMyOTIyNy4wMzMsInN1YiI6IjY4ZWM3ZTBiY2YyYmFkMjU5OGYxMTk5MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Qy5XZbaf7uuNfutEgzqVBwB5B6dm52ugFTIjv_CgZ8c";

  @override
  void onInit() {
    initLoad();
    super.onInit();
  }

  void initLoad() async {
    await cleanExpiredCache();
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
}
