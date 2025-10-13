import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:test_prep_2/modules/home/m/m_movie_card.dart';
import 'package:test_prep_2/modules/search/m/hive/h_cache_result.dart';
import 'package:test_prep_2/utli/const/hive_box_name.dart';
import 'package:test_prep_2/utli/services/dialog/dialog_service.dart';
import 'package:test_prep_2/utli/services/network_service/api_end_points.dart';
import 'package:test_prep_2/utli/services/network_service/api_service.dart';

class MovieSearchController extends GetxController {
  final TextEditingController txtSearch = TextEditingController();

  final RxBool xLoading = false.obs;
  final RxList<MovieCardModel> searchResults = <MovieCardModel>[].obs;
  final RxString query = ''.obs;

  late Box<CachedResult> cacheBox;

  static const cacheDuration = Duration(minutes: 30);

  @override
  void onInit() {
    super.onInit();
    cacheBox = Hive.box<CachedResult>(HiveBoxName.searchCache);

    debounce<String>(query, (value) async {
      if (value.isEmpty) {
        xLoading.value = false;
        searchResults.clear();
        return;
      }

      await searchMovies(value: value);
    }, time: const Duration(milliseconds: 600));
  }

  void onChange(String value) {
    query.value = value;

    if (value.isNotEmpty) {
      xLoading.value = true;
    } else {
      xLoading.value = false;
      searchResults.clear();
    }
  }

  Future<void> searchMovies({
    required String value,
    bool isDirectSearch = false,
  }) async {
    if (value.isEmpty) return;
    if (isDirectSearch) {
      xLoading.value = true;
    }

    final cached = cacheBox.get(value);
    if (cached != null &&
        DateTime.now().difference(cached.timestamp) < cacheDuration) {
      searchResults.assignAll(decodeMovieList(cached.json));
      xLoading.value = false;
      return;
    }

    final response = await ApiService().get(
      ApiEndPoint.searchMovie,
      queryParams: {"query": value, "page": "1"},
    );

    ApiService().validateResponse(
      response: response,
      onSuccess: (p0) async {
        final results =
            (p0['results'] as List)
                .take(10)
                .map((e) => MovieCardModel.fromMap(e))
                .toList();

        // save to cache with search value as key
        await cacheBox.put(
          value,
          CachedResult(
            json: encodeMovieList(results),
            timestamp: DateTime.now(),
          ),
        );

        searchResults.assignAll(results);
        xLoading.value = false;
      },
      onFailure: (p0) {
        DialogService().showMessageDialog("Something went wrong");
        xLoading.value = false;
      },
    );
  }
}
