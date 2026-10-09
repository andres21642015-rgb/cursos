import 'package:flutter/material.dart';
import '../data/datos_academia.dart';

class PantallaInicio extends StatefulWidget {
  const PantallaInicio({super.key});

  @override
  State<PantallaInicio> createState() => _PantallaInicioState();
}

class _PantallaInicioState extends State<PantallaInicio> {
  static const Color colorCiruela = Color(0xFF7A2E4D);
  static const Color colorBorde = Color(0xFFE5D3C0);

  bool estaCargando = true;
  List<Map<String, dynamic>> formaciones = [];

  @override
  void initState() {
    super.initState();
    cargarInformacion();
  }

  Future<void> cargarInformacion() async {
    final resultado = await traerFormaciones();
    setState(() {
      formaciones = resultado;
      estaCargando = false;
    });
  }

  Color colorPorNivel(String nivel) {
    switch (nivel) {
      case 'Básico':
        return const Color(0xFF4F8A8B); // verde azulado
      case 'Intermedio':
        return const Color(0xFFD08C60); // arena
      default:
        return colorCiruela;
    }
  }

  Widget construirTarjeta(Map<String, dynamic> item) {
    final Color colorNivel = colorPorNivel(item['nivel']);
    final bool abierta = item['inscripcionAbierta'];

    return Card(
      color: Colors.white,
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: const BorderSide(color: colorBorde, width: 1.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            CircleAvatar(
              radius: 26,
              backgroundColor: colorNivel,
              child: Icon(item['icono'], color: Colors.white),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['nombre'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: colorCiruela,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text('Docente: ${item['docente']}'),
                  Text('Duración: ${item['duracion']} horas'),
                  const SizedBox(height: 6),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    decoration: BoxDecoration(
                      color: colorNivel.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      item['nivel'],
                      style: TextStyle(
                        color: colorNivel,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              abierta ? Icons.check_circle : Icons.lock_outline,
              color: abierta ? const Color(0xFF4F8A8B) : Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Academia Creativa'),
        centerTitle: true,
        backgroundColor: colorCiruela,
        foregroundColor: Colors.white,
      ),
      body: estaCargando
          ? const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(color: colorCiruela),
                  SizedBox(height: 16),
                  Text(
                    'Cargando formaciones...',
                    style: TextStyle(color: colorCiruela),
                  ),
                ],
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(14),
              itemCount: formaciones.length,
              itemBuilder: (context, indice) {
                return construirTarjeta(formaciones[indice]);
              },
            ),
    );
  }
}