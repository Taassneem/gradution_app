import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/database/cache/cache_helper.dart';
import 'package:gradution_app/core/utils/api_keys.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/core/utils/servive_locator.dart';
import 'package:gradution_app/features/home/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'choosen_type.dart';

class ChooseViewBody extends StatelessWidget {
  const ChooseViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme text = Theme.of(context).textTheme;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(16.0.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.1.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(S.of(context).choose, style: text.titleMedium),
                    SizedBox(height: 24.h),
                    ChoosenType(
                      image: AppAssets.child,
                      type: S.of(context).child,
                      onTap: () {
                        BlocProvider.of<ProfileCubit>(context).getUserData();
                        getIt.get<CacheHelper>().saveData(
                            key: CacheHelperKey.childChoosen, value: true);
                        GoRouter.of(context)
                            .pushReplacement(AppRouter.baseView);
                      },
                    ),
                    ChoosenType(
                      image: AppAssets.parent,
                      type: S.of(context).parent,
                      onTap: () {
                        getIt.get<CacheHelper>().saveData(
                            key: CacheHelperKey.parentChoosen, value: true);
                        BlocProvider.of<ProfileCubit>(context).getUserData();
                        GoRouter.of(context).push(AppRouter.taskView);
                      },
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
