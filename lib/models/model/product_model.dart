// ignore_for_file: public_member_api_docs, sort_constructors_first
// this for ProductInfo

import 'package:equatable/equatable.dart';

import 'package:ecommerce_shop_app/config/images_manger.dart';
import 'package:ecommerce_shop_app/models/model/category_model.dart';
import 'package:ecommerce_shop_app/config/colors_manger.dart';

class ProductInfoModel extends Equatable {
  final int id;
  final String title;
  final String subTitle;
  final List<CategoryModel> categoriesType;
  final List<ProductInfoModel>? hotSales;
  String price;
  final String? addIcon;
  final int colorProdectImage;
  final String prodectImage;
  final String description;
  final int? currentIndex;
  final int? index;
  bool favorite;
  int count = 1;
  String priceProduct = "";
  double total = 0;

  final void Function()? onTap;
  int clickCount = 2;

  ProductInfoModel({
    this.index,
    this.favorite = false,
    this.hotSales,
    required this.id,
    required this.description,
    required this.categoriesType,
    required this.title,
    required this.subTitle,
    required this.price,
    this.addIcon,
    required this.colorProdectImage,
    required this.prodectImage,
    this.currentIndex,
    this.onTap,
  });

  @override
  List<Object?> get props => [
        title,
        subTitle,
        price,
        addIcon,
        colorProdectImage,
        prodectImage,
        currentIndex,
        description,
        index,
        favorite
      ];

  static List<ProductInfoModel> products = [
    ProductInfoModel(
      //  favorite: false,
      id: 0,
      categoriesType: CategoryModel.categories
          .where((name) =>
              name.categoryName == "All" || name.categoryName == "Mobile")
          .toList(),
      title: " iPad Pro",
      subTitle: "Space Gray (6th gen)",
      price: "2.00",
      colorProdectImage: ColorMangers.yellowgold,
      prodectImage: AssetsImages.mobileImage,
      description:
          'Apple-designed dynamic driver provides high-fidelity audio.Note : If the size of the earbud tips does not match the size of your ear canals or the headset is not worn properly in your ears, you may not obtain the correct sound qualities or call performance. Change the earbud tips to ones that fit more snugly in your ear',
    ),
    //
    ProductInfoModel(
      //     favorite: false,
      id: 1,
      categoriesType: CategoryModel.categories
          .where((name) =>
              name.categoryName == "All" || name.categoryName == "Computers")
          .toList(),
      title: "Magic Wireless",
      subTitle: "iPad Pro 12.9-Inch",
      price: "5.00",
      colorProdectImage: ColorMangers.yellowgold,
      prodectImage: AssetsImages.computer,
      description:
          'Apple-designed dynamic driver provides high-fidelity audio.Note : If the size of the earbud tips does not match the size of your ear canals or the headset is not worn properly in your ears, you may not obtain the correct sound qualities or call performance. Change the earbud tips to ones that fit more snugly in your ear',
    ),

    //
    ProductInfoModel(
      //  favorite: false,
      id: 2,
      categoriesType: CategoryModel.categories
          .where((name) =>
              name.categoryName == "All" || name.categoryName == "Mobile")
          .toList(),
      title: "Apple iPad Pro",
      subTitle: "Space Gray (6th gen)",
      price: "199.0",
      colorProdectImage: ColorMangers.yellowgold,
      prodectImage: AssetsImages.mobileImage,
      description:
          'Apple-designed dynamic driver provides high-fidelity audio.Note : If the size of the earbud tips does not match the size of your ear canals or the headset is not worn properly in your ears, you may not obtain the correct sound qualities or call performance. Change the earbud tips to ones that fit more snugly in your ear',
    ),
    //
    ProductInfoModel(
      //  favorite: false,
      id: 3,
      categoriesType: CategoryModel.categories
          .where((name) =>
              name.categoryName == "All" || name.categoryName == "Headsets")
          .toList(),
      title: "AirPods Max 5s",
      subTitle: "Winning Beats sound",
      price: "199.0",
      colorProdectImage: ColorMangers.yellowgold,
      prodectImage: AssetsImages.headPhoneImage,
      description:
          'Apple-designed dynamic driver provides high-fidelity audio.Note : If the size of the earbud tips does not match the size of your ear canals or the headset is not worn properly in your ears, you may not obtain the correct sound qualities or call performance. Change the earbud tips to ones that fit more snugly in your ear',
    ),
    //
    ProductInfoModel(
      //   favorite: false,
      id: 4,
      categoriesType: CategoryModel.categories
          .where((name) =>
              name.categoryName == "All" || name.categoryName == "Computers")
          .toList(),
      title: "Magic Wireless s",
      subTitle: "iPad Pro 12.9-Inch",
      price: "199.0",
      colorProdectImage: ColorMangers.yellowgold,
      prodectImage: AssetsImages.computer,
      description:
          'Apple-designed dynamic driver provides high-fidelity audio.Note : If the size of the earbud tips does not match the size of your ear canals or the headset is not worn properly in your ears, you may not obtain the correct sound qualities or call performance. Change the earbud tips to ones that fit more snugly in your ear',
    ),
    //
    ProductInfoModel(
      //  favorite: false,
      id: 5,
      categoriesType: CategoryModel.categories
          .where((name) =>
              name.categoryName == "All" || name.categoryName == "Headsets")
          .toList(),
      title: "AirPods Max 5",
      subTitle: "Winning Beats sound",
      price: "199.0",
      colorProdectImage: ColorMangers.yellowgold,
      prodectImage: AssetsImages.headPhoneImage,
      description:
          'Apple-designed dynamic driver provides high-fidelity audio.Note : If the size of the earbud tips does not match the size of your ear canals or the headset is not worn properly in your ears, you may not obtain the correct sound qualities or call performance. Change the earbud tips to ones that fit more snugly in your ear',
    ),
    //
    ProductInfoModel(
      //   favorite: false,
      id: 6,
      categoriesType: CategoryModel.categories
          .where((name) =>
              name.categoryName == "All" || name.categoryName == "Speakers")
          .toList(),
      title: "AirPods Max 6",
      subTitle: "Winning Beats sound",
      price: "199.0",
      colorProdectImage: ColorMangers.semiPink,
      prodectImage: AssetsImages.appStoreImage,
      description:
          'Apple-designed dynamic driver provides high-fidelity audio.Note : If the size of the earbud tips does not match the size of your ear canals or the headset is not worn properly in your ears, you may not obtain the correct sound qualities or call performance. Change the earbud tips to ones that fit more snugly in your ear',
    ),
    //
    ProductInfoModel(
      //   favorite: false,
      id: 7,
      categoriesType: CategoryModel.categories
          .where((name) =>
              name.categoryName == "All" || name.categoryName == "Headsets")
          .toList(),
      title: "AirPods Max 5 pro",
      subTitle: "Winning Beats sound",
      price: "199.0",
      colorProdectImage: ColorMangers.semiPink,
      prodectImage: AssetsImages.headPhoneImage,
      description:
          'Apple-designed dynamic driver provides high-fidelity audio.Note : If the size of the earbud tips does not match the size of your ear canals or the headset is not worn properly in your ears, you may not obtain the correct sound qualities or call performance. Change the earbud tips to ones that fit more snugly in your ear',
    ),
    //
    ProductInfoModel(
      id: 8,
      categoriesType: CategoryModel.categories
          .where((name) =>
              name.categoryName == "All" || name.categoryName == "Speakers")
          .toList(),
      title: "AirPods Max 6 s",
      subTitle: "Winning Beats sound",
      price: "199.0",
      colorProdectImage: ColorMangers.semiPink,
      prodectImage: AssetsImages.appStoreImage,
      description:
          'Apple-designed dynamic driver provides high-fidelity audio.Note : If the size of the earbud tips does not match the size of your ear canals or the headset is not worn properly in your ears, you may not obtain the correct sound qualities or call performance. Change the earbud tips to ones that fit more snugly in your ear',
    ),
    //
    ProductInfoModel(
      id: 9,
      categoriesType: CategoryModel.categories
          .where((name) =>
              name.categoryName == "All" || name.categoryName == "Speakers")
          .toList(),
      title: "AirPods Max 6 pro ",
      subTitle: "Winning Beats sound",
      price: "199.0",
      colorProdectImage: ColorMangers.semiPink,
      prodectImage: AssetsImages.appStoreImage,
      description:
          'Apple-designed dynamic driver provides high-fidelity audio.Note : If the size of the earbud tips does not match the size of your ear canals or the headset is not worn properly in your ears, you may not obtain the correct sound qualities or call performance. Change the earbud tips to ones that fit more snugly in your ear',
    ),
  ];
}
