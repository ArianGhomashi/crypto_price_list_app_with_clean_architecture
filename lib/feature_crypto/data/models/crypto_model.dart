import 'package:crypto_price_list_app_with_clean_architecture/feature_crypto/domain/entities/crypto_entity.dart';

class CryptoModel extends CryptoEntitiy {
  CryptoModel(
      {int? rank,
      String? name,
      String? symbol,
      double? priceUsd,
      double? changePercent24Hr})
      : super(
          rank: rank,
          name: name,
          symbol: symbol,
          priceUsd: priceUsd,
          changePercent24Hr: changePercent24Hr,
        );

  factory CryptoModel.fromJson(dynamic json) {
    return CryptoModel(
      rank: int.parse(json['rank']),
      name: json['name'],
      symbol: json['symbol'],
      priceUsd: double.parse(json['priceUsd']),
      changePercent24Hr: double.parse(json['changePercent24Hr']),
    );
  }
}
