import 'package:get/get.dart';
import 'package:test_prep_2/modules/home/m/m_movie_card.dart';
import 'package:test_prep_2/modules/movie_detail/m/m_cast_model.dart';
import 'package:test_prep_2/modules/movie_detail/m/m_movie_detail.dart';
import 'package:test_prep_2/utli/services/dialog/dialog_service.dart';
import 'package:test_prep_2/utli/services/network_service/api_end_points.dart';
import 'package:test_prep_2/utli/services/network_service/api_service.dart';

class MovieDetailController extends GetxController {
  final MovieCardModel movie;

  MovieDetailController(this.movie);
  final detailModel = Rxn<MovieDetailModel>();
  RxList<CastModel> castList = <CastModel>[].obs;
  RxBool xLoading = false.obs;
  RxBool xcastLoading = false.obs;
  RxDouble overlayOpacity = 0.0.obs;

  @override
  void onInit() {
    // make them run concurrently
    getMovieDetail();
    getMovieCast();
    startOverlay();
    super.onInit();
  }

  // final customCacheManager = CacheManager(
  //   Config(
  //     ImageCacheKeys.movieDetails,
  //     stalePeriod: const Duration(days: 7),
  //     maxNrOfCacheObjects: 100,
  //     fileService: HttpFileService(
  //       httpClient: TimeoutHttpClient(timeout: const Duration(seconds: 10)),
  //     ),
  //   ),
  // );

  void startOverlay() {
    Future.delayed(Duration(milliseconds: 200), () {
      overlayOpacity.value = 1.0;
    });
  }

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
  }

  Future<void> getMovieCast() async {
    xcastLoading.value = true;
    final response = await ApiService().get(
      ApiEndPoint.getCast(movie.id.toString()),
    );
    ApiService().validateResponse(
      response: response,
      onSuccess: (p0) {
        Iterable iterable = p0['cast'];
        final List<CastModel> newList = [];
        for (var element in iterable) {
          CastModel cast = CastModel.fromMap(element);
          newList.add(cast);
        }

        castList.addAll(newList);
        xcastLoading.value = false;
      },
      onFailure: (p0) {
        DialogService().showSnack(
          title: 'Sorry',
          message: "Something went wrong",
        );
        xcastLoading.value = false;
      },
    );
  }
}
