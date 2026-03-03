import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // 🔹 KEY del formulario para validar
  final _formKey = GlobalKey<FormState>(); // <-- NUEVO (controla validación)

  // 🔹 Controllers para capturar lo que escribe el usuario
  final TextEditingController _emailController =
      TextEditingController(); // <-- NUEVO
  final TextEditingController _passwordController =
      TextEditingController(); // <-- NUEVO

  @override
  void dispose() {
    // 🔹 IMPORTANTE: liberar memoria
    _emailController.dispose(); // <-- NUEVO
    _passwordController.dispose(); // <-- NUEVO
    super.dispose();
  }

  void _login() {
    // 🔹 Validar formulario antes de continuar
    if (_formKey.currentState!.validate()) {
      // <-- NUEVO (validación)

      String email = _emailController.text; // <-- Captura datos
      String password = _passwordController.text;

      // 🔹 Simulación de login
      if (email == "admin@puerta.com" && password == "1234") {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Acceso concedido")));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Credenciales incorrectas")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login - Control de Acceso")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          // <-- NUEVO (FORM)
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 🔹 Campo Email
              TextFormField(
                controller: _emailController, // <-- CONECTADO AL CONTROLLER
                decoration: const InputDecoration(
                  labelText: "Correo electrónico",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  // <-- VALIDACIÓN
                  if (value == null || value.isEmpty) {
                    return "Este campo es obligatorio";
                  }
                  if (!value.contains("@")) {
                    return "Ingrese un correo válido";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // 🔹 Campo Password
              TextFormField(
                controller: _passwordController, // <-- CONECTADO
                obscureText: true, // <-- Oculta contraseña
                decoration: const InputDecoration(
                  labelText: "Contraseña",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Ingrese su contraseña";
                  }
                  if (value.length < 4) {
                    return "Mínimo 4 caracteres";
                  }
                  return null;
                },
              ),

              const SizedBox(height: 30),

              // 🔹 Botón Login
              ElevatedButton(
                onPressed: _login, // <-- LLAMA FUNCIÓN
                child: const Text("Iniciar Sesión"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
