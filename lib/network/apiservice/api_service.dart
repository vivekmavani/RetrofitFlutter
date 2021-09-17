import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:taskretofitpicsy/network/model/bookresponses.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'http://www.demoaws.picsy.in/api')
abstract class ApiService {

  factory ApiService(Dio dio, {String? baseUrl})
  {
    dio.options = BaseOptions(
        receiveTimeout: 30000,
        connectTimeout: 30000,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer c3a79702a8ce0ee920f7c56d4f3488adaeb1eadd',
        }
    );
    //dio.interceptors.add{LogInterceptor(responseBody: true, requestBody: true)};
      return _ApiService(dio, baseUrl: baseUrl);
    }

    @GET('/yearbook/getyearbook/28a6883292e53e1df2792d7fcb867108')
    Future<BookResponses> fetchAlbum();
  }