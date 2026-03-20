import 'package:flutter/material.dart';
import 'package:quickeee/core/models/price_point.dart';

class ChartPainter extends CustomPainter {
  final List<PricePoint> points;

  ChartPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    if (points.isEmpty) return;

    final linePaint = Paint()
      ..color = Color(0xFF22b720)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final glowPaint = Paint()
      ..color = Color(0xFF22b720).withValues(alpha: 0.1)
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);

    final fillPaint = Paint()
      ..shader = LinearGradient(
        colors: [Color(0xFF22b720).withValues(alpha: 0.1), Colors.transparent],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    double minPrice = points
        .map((e) => e.price)
        .reduce((a, b) => a < b ? a : b);
    double maxPrice = points
        .map((e) => e.price)
        .reduce((a, b) => a > b ? a : b);

    double range = maxPrice - minPrice;
    if (range == 0) range = 1;

    final path = Path();
    final fillPath = Path();

    final count = points.length;
    final double dx = count > 1 ? size.width / (count - 1) : 0;

    for (int i = 0; i < count; i++) {
      final double x = dx * i;

      final y =
          size.height - ((points[i].price - minPrice) / range * size.height);

      if (i == 0) {
        path.moveTo(x, y);
        fillPath.moveTo(x, size.height);
        fillPath.lineTo(x, y);
      } else {
        final prevX = dx * (i - 1);
        final prevY =
            size.height -
            ((points[i - 1].price - minPrice) / range * size.height);

        final controlX = (prevX + x) / 2;

        path.cubicTo(controlX, prevY, controlX, y, x, y);
        fillPath.cubicTo(controlX, prevY, controlX, y, x, y);
      }
    }

    fillPath.lineTo(dx * (count - 1), size.height);
    fillPath.close();

    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(path, glowPaint);
    canvas.drawPath(path, linePaint);

    final last = points.last;
    final lastX = dx * (count - 1);
    final lastY = size.height - ((last.price - minPrice) / range * size.height);

    canvas.drawCircle(
      Offset(lastX, lastY),
      4,
      Paint()..color = Color(0xFF22b720),
    );
  }

  @override
  bool shouldRepaint(covariant ChartPainter oldDelegate) {
    return true;
  }
}
