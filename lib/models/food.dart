class Food {
  final String nombre;

  Food({required this.nombre});

  // Convertir JSON a objeto Food
  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(nombre: json['description']);
  }
}

// Este archivo define el modelo de datos "Food" que representa la información
// que recibimos desde la API. En este caso solo guardamos el nombre del alimento.
// La clase incluye un constructor y un factory llamado fromJson que permite
// convertir los datos que vienen en formato JSON desde la API a un objeto
// de tipo Food dentro de Flutter. Esto facilita trabajar con los datos
// dentro de la aplicación.
