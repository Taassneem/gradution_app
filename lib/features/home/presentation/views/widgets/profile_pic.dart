import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/features/home/presentation/manager/profile_cubit/profile_cubit.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            BlocProvider.of<ProfileCubit>(context).getUserData();
            GoRouter.of(context).push(AppRouter.profileView);
          },
          child: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is GetUserDataSuccess) {
                return Container(
                  width: 60.w,
                  height: 60.h,
                  margin: EdgeInsets.symmetric(horizontal: 18.r),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              state.userDataModel.user!.profilePic!.secureUrl!),
                          fit: BoxFit.cover)),
                );
              } else if (state is GetUserDataFailure) {
                return Text(state.errorMessage,
                    style: Theme.of(context).textTheme.titleMedium);
              } else {
                return Image.asset(AppAssets.profilePic, width: 60);
              }
            },
          ),
        )
      ],
    );
  }
}
