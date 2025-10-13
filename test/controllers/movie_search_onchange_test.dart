import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:test_prep_2/modules/search/c/c_search.dart';
import '../helpers/test_data.dart';


// this is a Unit test for Search Onchange

void main() {
  late MovieSearchController controller;

  setUp(() {
    controller = MovieSearchController();
  });

  test('onChange set loading true when query is notempty', () {
    controller.onChange('batman');
    expect(controller.xLoading.value, isTrue);
  });

  test(
    'onChange set loading false and clears results when query is empty',
    () {
      controller.searchResults.assignAll([sampleMovie]);

      controller.onChange('');
      expect(controller.xLoading.value, isFalse);
      expect(controller.searchResults, isEmpty);
    },
  );
}
