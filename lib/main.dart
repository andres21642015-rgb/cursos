import 'package:flutter/material.dart';
import 'screens/pantalla_inicio.dart';

void main() {
  runApp(const AcademiaApp());
}

class AcademiaApp extends StatelessWidget {
  const AcademiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Academia Creativa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF7A2E4D), // ciruela
        scaffoldBackgroundColor: const Color(0xFFFAF3E8), // crema
        useMaterial3: true,
      ),
      home: const PantallaInicio(),
    );
  }
}