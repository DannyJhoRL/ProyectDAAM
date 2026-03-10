import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/food.dart';

class FoodPage extends StatelessWidget {
  final ApiService apiService = ApiService();

  FoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Alimentos")),

      body: FutureBuilder<List<Food>>(
        future: apiService.obtenerAlimentos("milk"),

        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text("Error al cargar datos"));
          }

          final foods = snapshot.data!;

          return ListView.builder(
            itemCount: foods.length,

            itemBuilder: (context, index) {
              final food = foods[index];

              return Card(
                margin: const EdgeInsets.all(10),

                child: ListTile(
                  leading: const Icon(Icons.restaurant), // icono

                  title: Text(food.nombre),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
// Esta pantalla muestra los datos obtenidos desde la API dentro de la
// aplicación Flutter. Se utiliza FutureBuilder para esperar la respuesta
// del servicio ApiService que obtiene los alimentos desde internet.
// Mientras se cargan los datos se muestra un indicador de carga.
// Cuando los datos están disponibles, se construye una lista dinámica
// utilizando ListView.builder para mostrar cada alimento.
// Cada elemento se muestra dentro de una Card con un icono y un título,
// lo que mejora la presentación visual de la información en la interfaz.