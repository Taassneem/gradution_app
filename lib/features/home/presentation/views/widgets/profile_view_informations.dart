import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/func/is_arabic_func.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/features/home/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'drop_dwon_button.dart';
import 'profile_feature.dart';

class ProfileViewInformations extends StatelessWidget {
  const ProfileViewInformations({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(18.0.r),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              BlocProvider.of<ProfileCubit>(context).getUserData();
              GoRouter.of(context).push(AppRouter.userProfileView);
            },
            child: CustomProfileFeature(
              featureName: S.of(context).account,
              featureType: S.of(context).editProfile,
              featureTypeTwo: '',
              leading: const Icon(Icons.person, color: AppColor.purple),
              trailing: isArabic()
                  ? const Icon(Icons.keyboard_double_arrow_left_outlined)
                  : const Icon(Icons.keyboard_double_arrow_right_outlined),
            ),
          ),
          CustomProfileFeature(
            featureName: S.of(context).notification,
            featureType: S.of(context).notification,
            featureTypeTwo: '',
            leading: const Icon(Icons.notifications, color: AppColor.purple),
            trailing: CupertinoSwitch(
              value: false,
              onChanged: (value) {},
            ),
          ),
          CustomProfileFeature(
            featureName: S.of(context).more,
            featureType: S.of(context).language,
            leading: const Icon(
              Icons.language,
              color: AppColor.blue,
            ),
            trailing: const CustomDropDwonButton(),
            more: true,
            featureTypeTwo: S.of(context).swithAccount,
            leadingTwo: Image.asset(AppAssets.parents),
            trailingTwo: isArabic()
                ? const Icon(Icons.keyboard_double_arrow_left_outlined)
                : const Icon(Icons.keyboard_double_arrow_right_outlined),
          ),
        ],
      ),
    );
  }
}
