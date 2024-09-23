class Current {
  final double temperatura;
  final int umidadeRelativa;

  Current({
    required this.temperatura,
    required this.umidadeRelativa,
  });

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      temperatura: (json['temperature_2m'] ?? 0.0)
          .toDouble(), // Valor padrão 0.0 se for null
      umidadeRelativa: (json['relative_humidity_2m'] ?? 0)
          .toInt(), // Valor padrão 0 se for null
      // temperatura: json['temperature_2m'],
      // umidadeRelativa: json['relative_humidity_2m'],
    );
  }
}