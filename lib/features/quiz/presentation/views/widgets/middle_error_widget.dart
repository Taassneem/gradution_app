import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_assets.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:gradution_app/core/utils/app_string.dart';

class MiddleErrorWidget extends StatelessWidget {
  const MiddleErrorWidget({super.key});

  @override
  Widget build(BuildContext context) {
   
     return Center(  child: Card(
        color: AppColor.error,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AppAssets.error),
              Text(
                AppString.oops,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              Text(
                AppString.errorMessage,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  AppString.back,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: AppColor.errorMessage),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
