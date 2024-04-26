import 'package:flutter/material.dart';

// Punto de entrada de la aplicación
void main() {
  runApp(const MyApp());
}

// Clase principal de la aplicación
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Método que construye la interfaz de la aplicación
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('1390-22-5067'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        // Usamos CustomPaint para dibujar en el cuerpo de la aplicación
        body: CustomPaint(
          painter: MyCustomPainter(),
          child: Container(),
        ),
      ),
    );
  }
}

// Clase que extiende CustomPainter para dibujar formas personalizadas
class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final offsetX = size.width / 2;
    final offsetY = size.height / 2;

    // Dibuja un cuadrado con un estilo
    final squarePaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 6.0
      ..style = PaintingStyle.stroke;
    canvas.drawRect(
        Rect.fromCenter(
            center: Offset(offsetX, offsetY - 200), width: 100, height: 100),
        squarePaint);

    // Dibuja una línea con otro estilo
    final linePaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 6.0
      ..style = PaintingStyle.stroke;
    canvas.drawLine(Offset(offsetX - 100, offsetY - 100),
        Offset(offsetX + 100, offsetY - 100), linePaint);

    // Dibuja un círculo con otro estilo
    final circlePaint = Paint()
      ..color = Colors.green
      ..strokeWidth = 3.0
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(offsetX, offsetY), 50, circlePaint);

    // Dibuja un círculo con solo el borde con otro estilo
    final borderCirclePaint = Paint()
      ..color = Colors.purple
      ..strokeWidth = 5.0
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(Offset(offsetX, offsetY + 120), 50, borderCirclePaint);

    // Dibuja un cuadrado con texto adentro con otro estilo
    final textSquarePaint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill;
    canvas.drawRect(
        Rect.fromCenter(
            center: Offset(offsetX, offsetY + 250), width: 130, height: 100),
        textSquarePaint);
    final textPainter = TextPainter(
      text: const TextSpan(
        text: 'Lizardo Pérez',
        style: TextStyle(color: Colors.blue, fontSize: 20),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(canvas, Offset(offsetX - 60, offsetY + 240));
// Dibuja una línea curva con otro estilo
    final curvePaint = Paint()
      ..color = Colors.yellow
      ..strokeWidth = 7.0
      ..style = PaintingStyle.stroke;
    final path = Path()
      ..moveTo(offsetX - 170, offsetY + 250) // Punto de inicio
      ..quadraticBezierTo(
          offsetX, // Punto de control en el centro
          offsetY + 550, // Ajusta la "altura" del punto de control
          offsetX + 170, // Punto final
          offsetY + 250); // Ajusta la posición final de la curva
    canvas.drawPath(path, curvePaint);
  }

  // Método que determina si el lienzo debe ser repintado
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
