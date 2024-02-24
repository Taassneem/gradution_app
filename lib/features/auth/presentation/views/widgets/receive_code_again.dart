import 'package:flutter/material.dart';

import '../../../../../core/utils/app_string.dart';

class ReciveCodeAgain extends StatelessWidget {
  const ReciveCodeAgain({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(AppString.receiveCodeAgain,
            style: Theme.of(context).textTheme.titleSmall),
        GestureDetector(
          onTap: () {},
          child: Text(
            AppString.resend,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
