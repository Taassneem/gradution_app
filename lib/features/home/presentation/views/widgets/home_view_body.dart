import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:gradution_app/core/func/custom_toast.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/core/utils/widgets/custom_page_route_slide.dart';
import 'package:gradution_app/features/camera/presentation/views/camera_view.dart';
import 'package:gradution_app/features/home/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:gradution_app/features/quiz/presentation/views/quiz_view.dart';
import 'package:gradution_app/features/task/task_child/views/tasks_child_view.dart';
import 'package:gradution_app/generated/l10n.dart';

import 'item_field.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Row(
          children: [
            const Spacer(),
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
                              image: NetworkImage(state
                                  .userDataModel.user!.profilePic!.secureUrl!),
                              fit: BoxFit.cover)),
                    );
                  } else if (state is GetUserDataFailure) {
                    return showToast(state.errorMessage);
                  } else {
                    return Image.asset(AppAssets.profilePic, width: 60);
                  }
                },
              ),
            )
          ],
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Image.asset(AppAssets.topHome)]),
        Container(
          width: 375.w,
          decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: AppColor.purple, width: 2.w),
              ),
              borderRadius: BorderRadius.circular(100.w)),
          child: Padding(
            padding: EdgeInsets.only(top: 55.0.h, left: 12.w, right: 12.w),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  ItemField(
                      onTap: () {
                        Navigator.push(
                            context,
                            CustomPageRouteSlide(
                              child: const CameraView(),
                              direction: AxisDirection.right,
                            ));
                      },
                      color: AppColor.purple,
                      fieldName: S.of(context).camera,
                      image: AppAssets.robotWithCamera),
                  SizedBox(width: 20.w),
                  Column(
                    children: [
                      ItemField(
                        onTap: () {
                          Navigator.push(
                              context,
                              CustomPageRouteSlide(
                                child: const QuizView(),
                                direction: AxisDirection.left,
                              ));
                        },
                        color: AppColor.babyBlue,
                        fieldName: S.of(context).quiz,
                        image: AppAssets.quiz,
                        height: 170.h,
                      ),
                      SizedBox(height: 16.h),
                      ItemField(
                          onTap: () {
                            Navigator.push(
                                context,
                                CustomPageRouteSlide(
                                  child: const TasksChildView(),
                                  direction: AxisDirection.left,
                                ));
                          },
                          color: AppColor.pink,
                          fieldName: S.of(context).task,
                          image: AppAssets.task,
                          height: 180.h)
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
