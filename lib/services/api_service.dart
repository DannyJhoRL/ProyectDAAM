import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/food.dart';

class ApiService {
  static const String apiKey = "73dfO5z2o7UwuTmiGIYa8nelXKGmGCZsu1A9ERTn";

  Future<List<Food>> obtenerAlimentos(String query) async {
    final response = await http.get(
      Uri.parse(
        "https://api.nal.usda.gov/fdc/v1/foods/search?query=$query&api_key=$apiKey",
      ),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      List foodsJson = data["foods"];

      return foodsJson.map((food) => Food.fromJson(food)).toList();
    } else {
      throw Exception("Error al cargar alimentos");
    }
  }
}

// Este archivo contiene la clase ApiService que se encarga de conectarse
// con la API externa de alimentos. Utiliza la librería http para realizar
// una petición GET a la API USDA FoodData Central. Cuando la API responde,
// los datos se reciben en formato JSON y se convierten a una lista de
// objetos Food utilizando el modelo creado previamente. Si la respuesta
// es correcta (status 200), se devuelven los alimentos encontrados.
// En caso contrario se lanza una excepción de error.
