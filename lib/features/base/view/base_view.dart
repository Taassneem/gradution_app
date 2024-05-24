import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/features/home/presentation/views/home_view.dart';
import 'package:gradution_app/features/home/presentation/views/profile_view.dart';

class BaseView extends StatefulWidget {
  const BaseView({super.key});

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  int currentIndex = 0;
  List<Widget> views = const [HomeView(), ProfileView()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views[currentIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: const CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset(AppAssets.bottomBar),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        activeIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        height: 70.h,
        iconSize: 34,
        splashSpeedInMilliseconds: 300,
        activeColor: AppColor.purple,
        leftCornerRadius: 32,
        rightCornerRadius: 32,
        gapLocation: GapLocation.center,
        icons: const [Icons.home, Icons.person],
      ),
    );
  }
}
