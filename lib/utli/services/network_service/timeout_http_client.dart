// import 'package:http/http.dart';

// class TimeoutHttpClient extends BaseClient {
//   final Client _inner;
//   final Duration timeout;

//   TimeoutHttpClient({Client? inner, this.timeout = const Duration(seconds: 10)})
//     : _inner = inner ?? Client();

//   @override
//   Future<StreamedResponse> send(BaseRequest request) {
//     return _inner.send(request).timeout(timeout);
//   }
// }

// class ImageCacheKeys {
//   static const String movieDetails = "customDetailPosterCache";
//   static const String movieCard = "customCardPosterCache";
// }
