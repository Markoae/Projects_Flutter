class Dolar {
  String? dolarHigh;
  String? dolarLow;

  Dolar({
    this.dolarHigh,
    this.dolarLow,
  });

  Dolar.fromJson(Map<String, dynamic> json) {
    dolarHigh = json['high'];
    dolarLow = json['low'];
  }
}