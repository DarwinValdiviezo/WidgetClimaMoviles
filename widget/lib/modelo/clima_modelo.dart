class ClimaModelo {
  final String ciudad;
  final double temperatura;
  final String descripcion;

  ClimaModelo({
    required this.ciudad,
    required this.temperatura,
    required this.descripcion,
  });

  // Convertir de JSON a objeto
  factory ClimaModelo.fromJson(Map<String, dynamic> json) {
    return ClimaModelo(
      ciudad: json['name'], // Acceso correcto a la ciudad
      temperatura: json['main']
          ['temp'], // Corrección en el acceso a temperatura
      descripcion: json['weather'][0]
          ['description'], // Correcto para descripción
    );
  }
}
