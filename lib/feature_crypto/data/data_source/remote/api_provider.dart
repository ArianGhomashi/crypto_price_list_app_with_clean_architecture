import 'package:crypto_price_list_app_with_clean_architecture/core/utils/constants.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  Dio _dio = Dio();

  Future<dynamic> getCryptoData() async {
    var response = await _dio.get('${Constants.baseUrl}/assets');

    print(response.data);
    return response;
  }
}
