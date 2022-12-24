import 'package:crypto_price_list_app_with_clean_architecture/feature_crypto/data/data_source/remote/api_provider.dart';
import 'package:crypto_price_list_app_with_clean_architecture/feature_crypto/data/models/crypto_model.dart';
import 'package:crypto_price_list_app_with_clean_architecture/feature_crypto/domain/entities/crypto_entity.dart';
import 'package:crypto_price_list_app_with_clean_architecture/core/resources/data_state.dart';
import 'package:crypto_price_list_app_with_clean_architecture/feature_crypto/domain/repository/crypto_repository.dart';
import 'package:dio/dio.dart';

class CryptoRepositoryImpl extends CryptoRepository {
  ApiProvider apiProvider;

  CryptoRepositoryImpl(this.apiProvider);
  @override
  Future<DataState<List<CryptoEntitiy>>> fetchCryptoData() async {
    Response response = await apiProvider.getCryptoData();

    try {
      if (response.statusCode == 200) {
        List<CryptoEntitiy> cryptoList = response.data['data']
            .map<CryptoEntitiy>(
                (jsonObject) => CryptoModel.fromJson(jsonObject))
            .toList();

        return DataSuccess(cryptoList);
      } else {
        return DataFailed('Something went wrong..');
      }
    } catch (e) {
      return DataFailed('Please check your connection');
    }
  }
}
