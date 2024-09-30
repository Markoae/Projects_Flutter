class Tempo {
  String? time;
  int? interval;
  double? temperature2m;
  int? humidity2m;

  Tempo({this.time, this.interval, this.temperature2m, this.humidity2m});

  Tempo.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    interval = json['interval'];
    temperature2m = json['temperature_2m'];
    humidity2m = json['relative_humidity_2m'];
  }
}