import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradution_app/core/utils/widgets/custom_text_shimmer.dart';
import 'package:gradution_app/features/home/presentation/manager/profile_cubit/profile_cubit.dart';

class UserNameAndEmail extends StatelessWidget {
  const UserNameAndEmail({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is GetUserDataSuccess) {
          return Padding(
              padding: EdgeInsets.all(8.0.r),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      state.userDataModel.user!.userName!,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      state.userDataModel.user!.email!,
                      style: Theme.of(context).textTheme.displaySmall,
                    )
                  ]));
        } else if (state is GetUserDataFailure) {
          return Card(
              child: Center(
            child: Text(state.errorMessage,
                style: Theme.of(context).textTheme.titleSmall),
          ));
        } else {
          return Column(
            children: [
              const CustomTextShimmer(),
              SizedBox(height: 8.h),
              const CustomTextShimmer(),
            ],
          );
        }
      },
    );
  }
}
