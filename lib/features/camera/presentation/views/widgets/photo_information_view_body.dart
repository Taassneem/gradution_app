import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_assets.dart';

import 'icon_method.dart';

class PhotoInforamtionViewBody extends StatelessWidget {
  const PhotoInforamtionViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Align(
            alignment: Alignment.topLeft,
            child: Image.asset(AppAssets.chatbot)),
        Container(
          height: MediaQuery.sizeOf(context).height * 0.3,
          width: MediaQuery.sizeOf(context).width * 0.8,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
        ),
        const SizedBox(height: 24),
        Stack(children: [
          Container(
              padding: const EdgeInsets.all(16),
              alignment: Alignment.topRight,
              height: MediaQuery.sizeOf(context).height * 0.45,
              width: MediaQuery.sizeOf(context).width * 0.8,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(30)),
              child: Image.asset(AppAssets.chatbotMessage)),
          const Positioned(
            bottom: 2,
            right: 1,
            left: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconMethod(icon: Icons.volume_off),
                IconMethod(icon: Icons.translate),
              ],
            ),
          )
        ]),
      ],
    );
  }
}
