import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/func/custom_toast.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/features/home/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:gradution_app/generated/l10n.dart';

class DeleteAccountButton extends StatelessWidget {
  const DeleteAccountButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is DeleteUserFailure) {
          showToast(state.errorMessage);
        } else if (state is DeleteUserSuccess) {
          showToast(state.deleteUserModel.message!);
          GoRouter.of(context).pushReplacement(AppRouter.signUpView);
        }
      },
      builder: (context, state) {
        return state is DeleteUserLoading
            ? const Center(child: CircularProgressIndicator())
            : Container(
                decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(20.w),
                    border: Border.all(color: AppColor.error, width: 1.5.w)),
                child: ListTile(
                  leading: const Icon(
                    Icons.delete_outline,
                    color: AppColor.error,
                  ),
                  onTap: () {
                    BlocProvider.of<ProfileCubit>(context).deleteProfile();
                  },
                  title: Text(S.of(context).deleteAccount,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: AppColor.error)),
                ),
              );
      },
    );
  }
}
