import 'package:flutter/material.dart';

import 'custom_divider.dart';

class ChoosenFeature extends StatelessWidget {
  const ChoosenFeature({
    super.key,
    required this.feature,
    this.isFinalFeature = false,
  });
  final String feature;
  final bool isFinalFeature;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(feature, style: Theme.of(context).textTheme.titleSmall),
            Checkbox(
              value: false,
              onChanged: (value) {},
            )
          ],
        ),
        isFinalFeature ? const SizedBox.shrink() : const CustomDivider(),
      ],
    );
  }
}
