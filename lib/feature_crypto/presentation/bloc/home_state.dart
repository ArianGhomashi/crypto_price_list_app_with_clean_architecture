import 'package:crypto_price_list_app_with_clean_architecture/feature_crypto/presentation/bloc/crypto_status.dart';

class Homestate {
  CryptoStatus? cryptoStatus;

  Homestate({this.cryptoStatus});

  Homestate copyWith({CryptoStatus? newCryptoStatus}) {
    return Homestate(cryptoStatus: newCryptoStatus ?? cryptoStatus);
  }
}
