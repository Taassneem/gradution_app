import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution_app/core/utils/app_router.dart';
import 'package:gradution_app/features/auth/data/repo/dio_consumer.dart';
import 'package:gradution_app/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:gradution_app/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(DioConsumer(dio: Dio())),
        ),
      ],
      child: MaterialApp.router(
        theme: getThemeData(),
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
