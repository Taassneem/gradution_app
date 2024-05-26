import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/func/custom_toast.dart';
import 'package:gradution_app/core/func/is_arabic_func.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/features/home/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:gradution_app/generated/l10n.dart';

class CustomLogOut extends StatelessWidget {
  const CustomLogOut({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is LogOutSuccess) {
          showToast(state.logOutModel.message!);
          GoRouter.of(context).pushReplacement(AppRouter.signInView);
        } else if (state is LogOutFailure) {
          showToast(state.errorMessage);
        } else {
          const Center(child: CircularProgressIndicator());
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            BlocProvider.of<ProfileCubit>(context).logOut();
          },
          child: Container(
            padding: EdgeInsets.all(5.r),
            width: isArabic() ? 160.w : 133.w,
            decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.circular(10.w),
                border: Border.all(color: AppColor.error)),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(S.of(context).logout,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: AppColor.error)),
              leading: const Icon(Icons.logout_outlined, color: AppColor.error),
            ),
          ),
        );
      },
    );
  }
}
