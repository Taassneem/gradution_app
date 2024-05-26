import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/features/home/presentation/manager/profile_cubit/profile_cubit.dart';

import 'custom_logout.dart';
import 'custom_modal_bottom_sheet.dart';
import 'profile_view_informations.dart';
import 'user_name_and_email.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Padding(
            padding: EdgeInsets.only(top: 18.0.r),
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return const CustomModalBottomSheetProfilePic();
                    });
              },
              child: BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                if (state is GetUserDataSuccess) {
                  return Container(
                    width: 130.w,
                    height: 125.h,
                    decoration: BoxDecoration(
                        color: AppColor.lightGrey,
                        borderRadius: BorderRadius.circular(55.w),
                        image: DecorationImage(
                            image: CachedNetworkImageProvider(state
                                .userDataModel.user!.profilePic!.secureUrl!),
                            fit: BoxFit.cover)),
                  );
                } else if (state is GetUserDataFailure) {
                  return Text(state.errorMessage);
                } else {
                  return Badge(
                      label: const Icon(Icons.add, color: AppColor.lightGrey),
                      alignment: Alignment.bottomLeft,
                      backgroundColor: AppColor.purple,
                      padding: EdgeInsets.all(5.r),
                      largeSize: 35,
                      child: Container(
                        width: 130.w,
                        height: 125.h,
                        decoration: BoxDecoration(
                            color: AppColor.lightGrey,
                            borderRadius: BorderRadius.circular(55.w),
                            image: const DecorationImage(
                                image: AssetImage(AppAssets.profilePic),
                                fit: BoxFit.cover)),
                      ));
                }
              }),
            )),
        const UserNameAndEmail(),
        const ProfileViewInformations(),
        const CustomLogOut(),
        SizedBox(height: 24.h)
      ]),
    );
  }
}
