import 'package:flutter/material.dart';
import '../services/api_service.dart'; // <-- importamos la conexión con la API

class ApiTestPage extends StatefulWidget {
  const ApiTestPage({super.key});

  @override
  State<ApiTestPage> createState() => _ApiTestPageState();
}

class _ApiTestPageState extends State<ApiTestPage> {
  // Controller para capturar alimento
  final TextEditingController _foodController = TextEditingController();

  @override
  void dispose() {
    _foodController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Buscar proteína")),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            TextField(
              controller: _foodController,

              decoration: const InputDecoration(
                labelText: "Escribe alimento (milk, egg, chicken)",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () async {
                String alimento = _foodController.text;

                // Llamamos a la API
                await ApiService().obtenerAlimentos(alimento);
              },

              child: const Text("Buscar en API"),
            ),
          ],
        ),
      ),
    );
  }
}
