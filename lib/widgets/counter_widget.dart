import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.do_not_disturb_on_outlined,
              size: 25.spMin,
            )),
        Text(
          "1",
          style: Theme.of(context).textTheme.displaySmall,
        ),
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.add_circle_outline_outlined,
              size: 25.spMin,
            ))
      ],
    );
  }
}
