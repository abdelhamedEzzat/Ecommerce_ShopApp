import 'package:ecommerce_shop_app/widgets/button_widget.dart';
import 'package:ecommerce_shop_app/widgets/finance_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/counter_cubit/counter_cubit.dart';

class FinanceDetailsWidget extends StatelessWidget {
  const FinanceDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            child: const Text(" Have a coupon code? enter here"),
          ),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            textAlign: TextAlign.left,
            enabled: false,
            decoration: InputDecoration(
                hintText: "     Soon * ",
                hintStyle: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.red),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          const SizedBox(
            height: 5,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FinanceWidget(
                financeName: "Subtotal:",
                financeNumber:
                    " ${BlocProvider.of<CounterCubit>(context).subTotal} ",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              FinanceWidget(
                financeName: "DeliveryFee:",
                financeNumber:
                    "  ${BlocProvider.of<CounterCubit>(context).deliveryFee} ",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              FinanceWidget(
                financeName: "Discount:",
                financeNumber:
                    " ${BlocProvider.of<CounterCubit>(context).discount} ",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomPaint(
                  size: Size(MediaQuery.of(context).size.width, 1),

                  // Adjust the size as needed
                  // Custom painter

                  painter: DashedLinePainter(),
                ),
              ),
              FinanceWidget(
                financeName: "Total:",
                financeNumber:
                    "${BlocProvider.of<CounterCubit>(context).total}",
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
      ),
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
