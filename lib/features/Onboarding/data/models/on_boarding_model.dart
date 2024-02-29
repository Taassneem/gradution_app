import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/app_string.dart';

class OnBoardingModel {
  final String image;
  final String imageBack;
  final String title;
  final String subTitle;
  final Color color;

  OnBoardingModel({
    required this.imageBack,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.color,
  });
  static List<OnBoardingModel> onBoardingView = [
    OnBoardingModel(
      image: AppAssets.onboard1,
      title: AppString.onBoardingTitleOne,
      subTitle: AppString.onBoardingSubTitleOne,
      color: AppColor.purple,
      imageBack: AppAssets.backOn1,
    ),
    OnBoardingModel(
      image: AppAssets.onboard2,
      title: AppString.onBoardingTitleTwo,
      subTitle: AppString.onBoardingSubTitleTwo,
      color: AppColor.pink,
      imageBack: AppAssets.backOn2,
    ),
    OnBoardingModel(
      image: AppAssets.onboard3,
      title: AppString.onBoardingTitleThree,
      subTitle: AppString.onBoardingSubTitleThree,
      color: AppColor.babyBlue,
      imageBack: AppAssets.backOn3,
    ),
    OnBoardingModel(
      image: AppAssets.onboard4,
      title: AppString.onBoardingTitleFour,
      subTitle: AppString.onBoardingSubTitleFour,
      color: AppColor.blueOn,
      imageBack: AppAssets.backOn4,
    ),
  ];
}
