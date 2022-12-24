import 'package:crypto_price_list_app_with_clean_architecture/core/resources/data_state.dart';
import 'package:crypto_price_list_app_with_clean_architecture/feature_crypto/domain/entities/crypto_entity.dart';

abstract class CryptoRepository {
  Future<DataState<List<CryptoEntitiy>>> fetchCryptoData();
}
