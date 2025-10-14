import 'package:get/get.dart';
import 'package:test_prep_2/modules/home/m/m_movie_card.dart';
import 'package:test_prep_2/modules/movie_detail/m/m_movie_detail.dart';
import 'package:test_prep_2/utli/services/dialog/dialog_service.dart';
import 'package:test_prep_2/utli/services/network_service/api_end_points.dart';
import 'package:test_prep_2/utli/services/network_service/api_service.dart';

class MovieDetailController extends GetxController {
  final MovieCardModel movie;

  MovieDetailController(this.movie);
  final detailModel = Rxn<MovieDetailModel>();

  @override
  void onInit() {
    getMovieDetail();
    super.onInit();
  }

  RxBool xLoading = false.obs;

  Future<void> getMovieDetail() async {
    xLoading.value = true;
    final response = await ApiService().get(
      ApiEndPoint.getDetail(movie.id.toString()),
    );
    ApiService().validateResponse(
      response: response,
      onSuccess: (p0) {
        detailModel.value = MovieDetailModel.fromMap(p0);
        xLoading.value = false;
      },
      onFailure: (p0) {
        DialogService().showSnack(
          title: 'Sorry',
          message: "Something went wrong",
        );
        xLoading.value = false;
      },
    );
    update();
  }
}
