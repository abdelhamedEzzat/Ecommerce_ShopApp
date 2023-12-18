import 'package:ecommerce_shop_app/controller/cubits/counter_cubit/counter_cubit.dart';
import 'package:ecommerce_shop_app/models/model/product_model.dart';
import 'package:ecommerce_shop_app/view/screens/payment_getway_screen/paymet_getway_screen.dart';
import 'package:ecommerce_shop_app/view/widgets/button_widget.dart';
import 'package:ecommerce_shop_app/view/widgets/finance_category_type_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FinanceDetailsWidget extends StatelessWidget {
  const FinanceDetailsWidget({
    super.key,
    required this.productInfoModel,
  });
  final ProductInfoModel productInfoModel;
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
                hintText: "   Enter Your Coupon ",
                hintStyle: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Colors.grey),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10))),
          ),
          const SizedBox(
            height: 5,
          ),
          BlocBuilder<CounterCubit, CounterState>(
            builder: (context, state) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FinanceCategoryTypeWidget(
                    financeName: "Subtotal:",
                    financeNumber:
                        " ${BlocProvider.of<CounterCubit>(context).subTotal} ",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  FinanceCategoryTypeWidget(
                    financeName: "DeliveryFee:",
                    financeNumber:
                        "  ${BlocProvider.of<CounterCubit>(context).deliveryFee} ",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  FinanceCategoryTypeWidget(
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
                  FinanceCategoryTypeWidget(
                    financeName: "Total:",
                    financeNumber:
                        "${BlocProvider.of<CounterCubit>(context).total}",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Theme.of(context).colorScheme.primaryContainer),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  BlocBuilder<CounterCubit, CounterState>(
                    builder: (context, state) {
                      return ButtonWidget(
                        nameOfBotton: "Continue to Checkout",
                        onPress: () {
                          Navigator.pushNamed(
                            context,
                            PaymentGetwayScreen.routeName,
                          );
                        },
                      );
                    },
                  )
                ],
              );
            },
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
