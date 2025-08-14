import 'package:flutter/material.dart';

void main() {
  runApp(const RelayModuleManualApp());
}

class RelayModuleManualApp extends StatelessWidget {
  const RelayModuleManualApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manual Módulo Relé 16 Canales',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo, fontFamily: 'Roboto'),
      home: const ProductManualScreen(),
    );
  }
}

class ProductManualScreen extends StatelessWidget {
  const ProductManualScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manual del Producto'),
        centerTitle: true,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título
            const Text(
              'Módulo de Relé de 16 Canales',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
            const Text(
              'Manual v1.0',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // Imagen (Placeholder)
            Center(
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blueGrey[100],
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://placehold.co/600x300/1e40af/ffffff?text=Módulo+Relé+16+CH',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Descripción
            const SectionTitle('Descripción'),
            const Text(
              'El módulo de relé de 16 canales permite controlar dispositivos de alto voltaje (AC/DC) desde microcontroladores como ESP32, Arduino o Raspberry Pi. Cada canal soporta hasta 10A/250V AC y está aislado ópticamente para proteger el controlador.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 16),

            // Especificaciones
            const SectionTitle('Especificaciones'),
            const SpecItem('Canales', '16'),
            const SpecItem(
              'Voltaje de control',
              '3.3V - 5V (compatible ESP32)',
            ),
            const SpecItem(
              'Alimentación',
              '5V DC (fuente externa recomendada)',
            ),
            const SpecItem('Corriente', '~320mA (todos activos)'),
            const SpecItem('Tipo de relé', 'SRD-05VDC-SL-C'),
            const SpecItem('Indicadores LED', '1 por canal'),
            const SizedBox(height: 16),

            // Conexión con ESP32
            const SectionTitle('Conexión con ESP32'),
            const Text(
              'Conecta cada GPIO del ESP32 a los pines IN1 a IN16. Usa una fuente externa de 5V para VCC y JDVCC.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Image.network(
              'https://placehold.co/600x200/f1f5f9/334155?text=Diagrama+de+Conexión+ESP32+-+Relé+16CH',
              height: 150,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),

            // Advertencia
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.orange[100],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.orange[300]!, width: 1),
              ),
              child: Row(
                children: const [
                  Icon(Icons.warning_amber, color: Colors.orange),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'No conecte voltajes altos sin aislamiento. Use cajas protectoras.',
                      style: TextStyle(fontSize: 14, color: Colors.orange),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Aplicaciones
            const SectionTitle('Aplicaciones'),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                Chip(
                  label: Text('Domótica'),
                  backgroundColor: Colors.blue[100],
                ),
                Chip(label: Text('Riego'), backgroundColor: Colors.green[100]),
                Chip(
                  label: Text('Industrial'),
                  backgroundColor: Colors.grey[100],
                ),
                Chip(
                  label: Text('Iluminación'),
                  backgroundColor: Colors.yellow[100],
                ),
                Chip(
                  label: Text('Climatización'),
                  backgroundColor: Colors.teal[100],
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Código ejemplo
            const SectionTitle('Código de ESPHome (ESP32 - Arduino)'),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(8),
              ),
              child: SelectableText(
                '''
const int relayPins[16] = {12, 13, 14, 15, 2, 4, 16, 17, 
                           5, 18, 19, 21, 22, 23, 25, 26};

void setup() {
  for (int i = 0; i < 16; i++) {
    pinMode(relayPins[i], OUTPUT);
    digitalWrite(relayPins[i], HIGH); // Apagado
  }
}

void loop() {
  for (int i = 0; i < 16; i++) {
    digitalWrite(relayPins[i], LOW);  // Encender
    delay(500);
    digitalWrite(relayPins[i], HIGH); // Apagar
  }
}
                ''',
                style: const TextStyle(
                  fontFamily: 'Monospace',
                  fontSize: 12,
                  color: Colors.limeAccent,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Footer
            const Text(
              'Soporte: soporte@relaytech.com | Web: relaytech.com/manual-16ch',
              style: TextStyle(fontSize: 12, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              '© 2025 RelayTech. Todos los derechos reservados.',
              style: TextStyle(fontSize: 10, color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.indigo,
        ),
      ),
    );
  }
}

class SpecItem extends StatelessWidget {
  final String label;
  final String value;

  const SpecItem(this.label, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          SizedBox(
            width: 160,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.blueGrey,
              ),
            ),
          ),
          Text(': $value', style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
