import 'package:get/get.dart';
import 'package:test_prep_2/modules/home/m/m_movie_card.dart';
import 'package:test_prep_2/utli/services/dialog/dialog_service.dart';
import 'package:test_prep_2/utli/services/network_service/api_end_points.dart';
import 'package:test_prep_2/utli/services/network_service/api_service.dart';

class HomeController extends GetxController {
  bool xListLoading = false;
  bool xListLoadingMore = false;
  int page = 1;
  bool isEndOfList = false;

  List<MovieCardModel> allList = [];

  Future<void> getInitMovieList() async {
    page = 1;
    allList.clear();
    getMovieList(isAppend: false);
  }

  Future<void> getMoreMovieList() async {
    if (!isEndOfList && !xListLoadingMore) {
      getMovieList(isAppend: true);
    }
  }

  Future<void> getMovieList({required bool isAppend}) async {
    if (isAppend) {
      xListLoadingMore = true;
      update();
    } else {
      xListLoading = true;
      update();
    }

    final response = await ApiService().get(
      '${ApiEndPoint.nowShowing}?language=en-US&page=$page',
    );
    ApiService().validateResponse(
      response: response,
      onSuccess: (p0) {
        page++;
        Iterable iterable = p0['results'];
        final List<MovieCardModel> newList = [];
        for (var element in iterable) {
          MovieCardModel record = MovieCardModel.fromMap(element);
          newList.add(record);
        }
        isEndOfList = newList.isEmpty;

        allList = isAppend ? [...allList, ...newList] : newList;
      },
      onFailure: (p0) {
        DialogService().showMessageDialog("Something went wrong");
      },
    );
    if (isAppend) {
      xListLoadingMore = false;
    } else {
      xListLoading = false;
    }

    update();
  }
}
