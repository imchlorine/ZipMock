import 'package:dio/dio.dart';
import 'package:zipmock/services/dio_client.dart';

class APIService {
 DioClient dioClient;
  String _baseUrl = "";

  APIService() {
    var dio = Dio();
    dioClient = DioClient(_baseUrl, dio);
  }

}
