import 'package:fluttertoast/fluttertoast.dart';
import 'package:gradution_app/core/utils/app_color.dart';

showToast(String msg, {bool task = false}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: task ? AppColor.pink : AppColor.purple,
      textColor: AppColor.black,
      fontSize: 16.0);
}
