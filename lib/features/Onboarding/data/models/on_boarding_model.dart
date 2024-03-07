import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/generated/l10n.dart';

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
      title: S.current.onBoardingTitleOne,
      subTitle: S.current.onBoardingSubTitleOne,
      color: AppColor.purple,
      imageBack: AppAssets.backOn1,
    ),
    OnBoardingModel(
      image: AppAssets.onboard2,
      title: S.current.onBoardingTitleTwo,
      subTitle: S.current.onBoardingSubTitleTwo,
      color: AppColor.pink,
      imageBack: AppAssets.backOn2,
    ),
    OnBoardingModel(
      image: AppAssets.onboard3,
      title: S.current.onBoardingTitleThree,
      subTitle: S.current.onBoardingSubTitleThree,
      color: AppColor.babyBlue,
      imageBack: AppAssets.backOn3,
    ),
    OnBoardingModel(
      image: AppAssets.onboard4,
      title: S.current.onBoardingTitleFour,
      subTitle: S.current.onBoardingSubTitleFour,
      color: AppColor.blueOn,
      imageBack: AppAssets.backOn4,
    ),
  ];
}
