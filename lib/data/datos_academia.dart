import 'package:flutter/material.dart';

// Colección tipada: lista de mapas con clave String y valor dinámico
// (dynamic porque mezclamos texto, enteros, booleanos e iconos)
final List<Map<String, dynamic>> catalogoLocal = [
  {
    'nombre': 'Edición de fotografia',
    'docente': 'Juan Cuervo',
    'duracion': 10, // horas, como entero
    'nivel': 'Básico',
    'inscripcionAbierta': false,
    'icono': Icons.camera_alt,
  },
  {
    'nombre': 'Habitos Saludables',
    'docente': 'Pedro Antonio Flores',
    'duracion': 80,
    'nivel': 'Básico',
    'inscripcionAbierta': true,
    'icono': Icons.restaurant,
  },
  {
    'nombre': 'Pintura y medios digitales',
    'docente': 'Katherine Ocampo',
    'duracion': 100,
    'nivel': 'Intermedio',
    'inscripcionAbierta': false,
    'icono': Icons.brush,
  },
  {
    'nombre': 'Armonia Musical',
    'docente': 'Julián Montoya',
    'duracion': 100,
    'nivel': 'Intermedio',
    'inscripcionAbierta': false,
    'icono': Icons.headphones,
  },
  {
    'nombre': 'Producción Audiovisual',
    'docente': 'Hernando Arco',
    'duracion': 50,
    'nivel': 'Avanzado',
    'inscripcionAbierta': true,
    'icono': Icons.movie_creation,
  },
];

// Función asíncrona que simula una consulta a un servidor
Future<List<Map<String, dynamic>>> traerFormaciones() async {
  await Future.delayed(const Duration(seconds: 2));
  return catalogoLocal;
}