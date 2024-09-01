import 'package:dio/dio.dart';
import 'package:riverpod_newsapp/constants/constants.dart';

class NewsServices {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiUrls.baseUrl,
      responseType: ResponseType.json,
    ),
  );

  getNews() async {
    var response = await dio.get('&language=en');
    return response.data;
  }
}
