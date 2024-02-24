import 'package:flutter/material.dart';

class CustomWelcomeText extends StatelessWidget {
  const CustomWelcomeText({
    super.key,
    required this.welcome,
    required this.welcomeSubTitle,
  });
  final String welcome;
  final String welcomeSubTitle;
  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(
          welcome,
          style: theme.titleMedium,
        ),
        const SizedBox(height: 5),
        SizedBox(
          width: 250,
          child: Text(
            welcomeSubTitle,
            textAlign: TextAlign.center,
            style: theme.titleSmall,
          ),
        ),
      ],
    );
  }
}
