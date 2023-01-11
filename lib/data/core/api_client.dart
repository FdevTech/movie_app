import 'package:dio/dio.dart';

import '../../common/Api_Constant.dart';

class ApiClient {

  final Dio _client;

  ApiClient(this._client);

  dynamic get(String path) async {
    final response= await _client.get(
        path,
        queryParameters: {
          'api_key':ApiConstant.API_KEY
        }
    );
    if(response.statusCode ==200)
    {
      final responseBody = response.data;
      return responseBody;

    }else {
      throw Exception("Something went worrong");
    }
  }
}