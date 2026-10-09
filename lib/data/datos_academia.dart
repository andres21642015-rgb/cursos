import 'package:flutter/material.dart';

// Colección tipada: lista de mapas con clave String y valor dinámico
// (dynamic porque mezclamos texto, enteros, booleanos e iconos)
final List<Map<String, dynamic>> catalogoLocal = [
  {
    'nombre': 'Fotografía con celular',
    'docente': 'Marcela Ríos',
    'duracion': 20, // horas, como entero
    'nivel': 'Básico',
    'inscripcionAbierta': true,
    'icono': Icons.camera_alt,
  },
  {
    'nombre': 'Cocina saludable',
    'docente': 'Andrés Palacios',
    'duracion': 32,
    'nivel': 'Intermedio',
    'inscripcionAbierta': true,
    'icono': Icons.restaurant,
  },
  {
    'nombre': 'Ilustración digital',
    'docente': 'Laura Caicedo',
    'duracion': 40,
    'nivel': 'Intermedio',
    'inscripcionAbierta': false,
    'icono': Icons.brush,
  },
  {
    'nombre': 'Producción musical',
    'docente': 'Julián Montoya',
    'duracion': 60,
    'nivel': 'Avanzado',
    'inscripcionAbierta': true,
    'icono': Icons.headphones,
  },
  {
    'nombre': 'Edición de video',
    'docente': 'Natalia Bedoya',
    'duracion': 28,
    'nivel': 'Básico',
    'inscripcionAbierta': false,
    'icono': Icons.movie_creation,
  },
];

// Función asíncrona que simula una consulta a un servidor
Future<List<Map<String, dynamic>>> traerFormaciones() async {
  await Future.delayed(const Duration(seconds: 2));
  return catalogoLocal;
}