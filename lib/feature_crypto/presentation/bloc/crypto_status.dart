import 'package:crypto_price_list_app_with_clean_architecture/feature_crypto/domain/entities/crypto_entity.dart';

abstract class CryptoStatus {}

class CryptoLoading extends CryptoStatus {}

class CryptoCompleted extends CryptoStatus {
  List<CryptoEntitiy> cryptoList;

  CryptoCompleted(this.cryptoList);
}

class CryptoError extends CryptoStatus {
  String message;

  CryptoError(this.message);
}
