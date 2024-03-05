import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution_app/core/global_cubit/global_cubit.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              BlocProvider.of<GlobalCubit>(context).changeLang();
            },
            icon: Image.asset(AppAssets.arabic)),
        actions: [
          IconButton(
              onPressed: () {}, icon: Image.asset(AppAssets.model, width: 60))
        ],
      ),
      body: const HomeViewBody(),
    );
  }
}
