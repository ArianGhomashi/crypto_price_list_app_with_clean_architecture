class CryptoEntitiy {
  int? rank;
  String? name;
  String? symbol;
  double? priceUsd;
  double? changePercent24Hr;

  CryptoEntitiy(
      {this.rank,
      this.name,
      this.priceUsd,
      this.changePercent24Hr,
      this.symbol});
}
