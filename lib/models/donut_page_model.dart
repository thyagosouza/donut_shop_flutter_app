import 'package:donut_shop_app/core/core.dart';

class DonutPageModel {
  String? imgUrl;
  String? logoImgUrl;

  DonutPageModel({
    this.imgUrl,
    this.logoImgUrl,
  });
}

final List<DonutPageModel> pages = [
  DonutPageModel(
      imgUrl: AppImages.donutPromo1, logoImgUrl: AppImages.donutLogoWhiteText),
  DonutPageModel(
      imgUrl: AppImages.donutPromo2, logoImgUrl: AppImages.donutLogoWhiteText),
  DonutPageModel(
      imgUrl: AppImages.donutPromo3, logoImgUrl: AppImages.donutLogoRedText),
];
