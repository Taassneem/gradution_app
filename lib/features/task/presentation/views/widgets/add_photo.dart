// import 'dart:developer';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gradution_app/core/func/custom_snack_bar.dart';
// import 'package:gradution_app/core/utils/app_assets.dart';
// import 'package:gradution_app/core/utils/app_color.dart';
// import 'package:gradution_app/features/task/presentation/manager/cubit/task_cubit.dart';
// import 'package:gradution_app/features/task/presentation/views/widgets/task_elevated_button.dart';
// import 'package:gradution_app/generated/l10n.dart';

// import '../../../../splash/presentation/views/widget/custom_ok_elevated_button.dart';

// class AddPhoto extends StatelessWidget {
//   const AddPhoto({super.key, this.isEditTask = false});
//   final bool isEditTask;
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: SizedBox(
//         width: MediaQuery.sizeOf(context).width * 0.9.w,
//         child: Card(
//           color: AppColor.pink,
//           child: Padding(
//             padding: EdgeInsets.all(18.0.r),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 ListTile(
//                   title: Text(S.of(context).addPhoto,
//                       style: Theme.of(context).textTheme.titleMedium),
//                   trailing: Image.asset(AppAssets.addPhoto),
//                 ),
//                 BlocProvider.of<TaskCubit>(context).taskImageFromGallery == null
//                     ? Container(
//                         alignment: Alignment.center,
//                         width: MediaQuery.sizeOf(context).width * 0.6.w,
//                         height: MediaQuery.sizeOf(context).height * 0.3.h,
//                         decoration: BoxDecoration(
//                             color: AppColor.white,
//                             borderRadius: BorderRadius.circular(10.w)),
//                         child: Image.asset(AppAssets.addPhoto))
//                     : Container(
//                         alignment: Alignment.center,
//                         width: MediaQuery.sizeOf(context).width * 0.6.w,
//                         height: MediaQuery.sizeOf(context).height * 0.3.h,
//                         decoration: BoxDecoration(
//                             image: DecorationImage(
//                               image: FileImage(File(
//                                   BlocProvider.of<TaskCubit>(context)
//                                       .taskImageFromGallery!
//                                       .path)),
//                             ),
//                             borderRadius: BorderRadius.circular(20.w)),
//                       ),
//                 SizedBox(height: 24.h),
//                 BlocConsumer<TaskCubit, TaskState>(
//                   listener: (context, state) {
//                     if (state is UploadingPhotoSuccess) {
//                       showSnackBar(context,
//                           content: Text(S.of(context).photoUploadSuccessfully));
//                       isEditTask
//                           ? BlocProvider.of<TaskCubit>(context).editImage =
//                               BlocProvider.of<TaskCubit>(context)
//                                   .taskImageFromGallery!
//                                   .path
//                           : BlocProvider.of<TaskCubit>(context).image =
//                               BlocProvider.of<TaskCubit>(context)
//                                   .taskImageFromGallery!
//                                   .path;
//                     } else if (state is UploadingPhotoFailure) {
//                       log(state.errorMessage);
//                     }
//                   },
//                   builder: (context, state) {
//                     return TaskElevatedButton(
//                       upload: true,
//                       isWhite: true,
//                       onPressed: () {
//                         BlocProvider.of<TaskCubit>(context)
//                             .pickImageWithGallery();
//                       },
//                     );
//                   },
//                 ),
//                 SizedBox(height: 24.h),
//                 CustomOkElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   text: S.of(context).ok,
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
