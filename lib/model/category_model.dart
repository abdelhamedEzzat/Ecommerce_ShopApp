import 'package:ecommerce_shop_app/config/images_manger.dart';
import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final String categoryName;
  final String iconImage;
  final Function() onTap;

  const CategoryModel({
    required this.categoryName,
    required this.iconImage,
    required this.onTap,
  });

  @override
  List<Object?> get props => [categoryName, iconImage, onTap];

  static List<CategoryModel> categories = [
    CategoryModel(
      categoryName: "All",
      iconImage: AssetsImages.mobileIcon,
      onTap: () {},
    ),
    CategoryModel(
        categoryName: "Computers",
        iconImage: AssetsImages.mobileIcon,
        onTap: () {}),
    CategoryModel(
        categoryName: "Headsets",
        iconImage: AssetsImages.mobileIcon,
        onTap: () {}),
    CategoryModel(
        categoryName: "Speakers",
        iconImage: AssetsImages.mobileIcon,
        onTap: () {}),
  ];
}
