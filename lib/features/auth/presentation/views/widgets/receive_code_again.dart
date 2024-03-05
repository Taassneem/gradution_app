import 'package:flutter/material.dart';
import 'package:gradution_app/generated/l10n.dart';


class ReciveCodeAgain extends StatelessWidget {
  const ReciveCodeAgain({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(S.of(context).receiveCodeAgain,
            style: Theme.of(context).textTheme.titleSmall),
        GestureDetector(
          onTap: () {},
          child: Text(
            S.of(context).resend,
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
