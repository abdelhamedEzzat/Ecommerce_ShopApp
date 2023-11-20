import 'package:ecommerce_shop_app/widgets/button_widget.dart';
import 'package:ecommerce_shop_app/widgets/finance_widget.dart';
import 'package:flutter/material.dart';

class FinanceDetailsWidget extends StatelessWidget {
  const FinanceDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          child: const Text(" Have a coupon code? enter here"),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(vertical: 10),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
        ),
        const SizedBox(
          height: 5,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            FinanceWidget(
              financeName: "Subtotal:",
              financeNumber: "4,521",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            FinanceWidget(
              financeName: "DeliveryFree:",
              financeNumber: "5",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            FinanceWidget(
              financeName: "Discount:",
              financeNumber: "25%",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: CustomPaint(
                size: Size(MediaQuery.of(context).size.width,
                    1), // Adjust the size as needed
                painter: DashedLinePainter(), // Custom painter
              ),
            ),
            FinanceWidget(
              financeName: "Total:",
              financeNumber: "4,458.50",
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.primaryContainer),
            ),
            const SizedBox(
              height: 5,
            ),
            ButtonWidget(
              nameOfBotton: "Continue to Checkout",
              onPress: () {},
            )
          ],
        )
      ],
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.square // Optional: Change the line cap style
      ..style = PaintingStyle.stroke;

    const dashWidth = 5; // Adjust the width of each dash
    const dashSpace = 5; // Adjust the space between dashes

    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );

      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
