import 'package:flutter/material.dart';
import 'package:gradution_app/core/func/is_arabic_func.dart';

class ArrowBack extends StatelessWidget {
  const ArrowBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isArabic() ? Alignment.centerRight : Alignment.centerLeft,
      child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back)),
    );
  }
}
