// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerce_shop_app/persentation%20_%20layer/animation/home_view_animation.dart';
import 'package:ecommerce_shop_app/persentation%20_%20layer/recorses/font_manger.dart';
import 'package:ecommerce_shop_app/persentation%20_%20layer/recorses/images_manger.dart';
import 'package:ecommerce_shop_app/widgets/componant_widgets/list_view_builder_widget.dart';
import 'package:ecommerce_shop_app/widgets/home_view_widget/advertisements_widget.dart';
import 'package:ecommerce_shop_app/widgets/home_view_widget/list_ad.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_shop_app/widgets/componant_widgets/app_bar_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ScrollController _scrollController = ScrollController();
  @override

  // intial state for advertisement
  //
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      double minScrollContraller = _scrollController.position.minScrollExtent;
      double maxScrollContraller = _scrollController.position.maxScrollExtent;

      animateFromMinToMax(
          maxScrollContraller,
          minScrollContraller,
          maxScrollContraller,
          Curves.linear,
          durationSecond20,
          _scrollController);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        title: Image.asset(
          AssetsImages.logoImage,
          height: SizeWidget.s24,
          width: SizeWidget.s104,
        ),
      ),
      drawer: const Drawer(),
      body: Column(children: [
        SizedBox(
            height: SizeWidget.s175,
            child: listViewBuilder(
                controller: _scrollController,
                itemCount: adList.length,
                scrollDirection: Axis.horizontal,
                shirnkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return advertisementsUi(context, adList[index]);
                })),
        //
      ]),
    );
  }
}
