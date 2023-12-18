import 'package:flutter/material.dart';

class FinanceCategoryTypeWidget extends StatelessWidget {
  final String financeName;
  final String financeNumber;
  final TextStyle? style;
  const FinanceCategoryTypeWidget({
    Key? key,
    required this.financeName,
    required this.financeNumber,
    required this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(financeName, style: style),
          const Spacer(),
          Text("\$", style: style),
          Text(financeNumber, style: style)
        ],
      ),
    );
  }
}
