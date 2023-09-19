import 'package:flutter/material.dart';

ListView listViewBuilder(
    {required Widget? Function(BuildContext, int) itemBuilder,
    required int itemCount,
    required bool shirnkWrap,
    required Axis scrollDirection,
    ScrollController? controller}) {
  return ListView.builder(
    itemBuilder: itemBuilder,
    itemCount: itemCount,
    shrinkWrap: shirnkWrap,
    scrollDirection: scrollDirection,
    controller: controller,
  );
}
