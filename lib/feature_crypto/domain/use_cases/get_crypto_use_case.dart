import 'package:crypto_price_list_app_with_clean_architecture/core/resources/data_state.dart';
import 'package:crypto_price_list_app_with_clean_architecture/core/use_case/use_case.dart';
import 'package:crypto_price_list_app_with_clean_architecture/feature_crypto/domain/entities/crypto_entity.dart';
import 'package:crypto_price_list_app_with_clean_architecture/feature_crypto/domain/repository/crypto_repository.dart';

class GetCryptoUseCase extends UseCase<DataState<List<CryptoEntitiy>>> {
  CryptoRepository cryptoRepository;

  GetCryptoUseCase(this.cryptoRepository);
  @override
  Future<DataState<List<CryptoEntitiy>>> call() {
    return cryptoRepository.fetchCryptoData();
  }
}
