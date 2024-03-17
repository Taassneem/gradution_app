import 'package:flutter/material.dart';
import 'package:gradution_app/core/utils/app_color.dart';
import 'package:intl/intl.dart';

class NameSpeaker extends StatelessWidget {
  const NameSpeaker({
    super.key,
    this.isWhite = false,
    this.onPressed,
  });
  final bool isWhite;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isArabic() ? Alignment.centerRight : Alignment.centerLeft,
      child: CircleAvatar(
        radius: 25,
        backgroundColor: isWhite ? Colors.white : AppColor.babyBlue,
        child: IconButton(
            onPressed: onPressed, icon: const Icon(Icons.volume_up_outlined)),
      ),
    );
  }
}

bool isArabic() {
  return Intl.getCurrentLocale() == 'ar';
}
