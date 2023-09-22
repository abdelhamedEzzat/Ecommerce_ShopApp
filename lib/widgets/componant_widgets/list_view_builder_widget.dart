import 'package:flutter/material.dart';

ListView listViewBuilder(
    {required Widget? Function(BuildContext, int) itemBuilder,
    required int itemCount,
    required bool shirnkWrap,
    required Axis scrollDirection,
    ScrollPhysics? physics,
    EdgeInsetsGeometry? padding,
    ScrollController? controller}) {
  return ListView.builder(
    padding: padding,
    itemBuilder: itemBuilder,
    itemCount: itemCount,
    shrinkWrap: shirnkWrap,
    scrollDirection: scrollDirection,
    physics: physics,
    controller: controller,
  );
}
