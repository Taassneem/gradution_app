import 'package:flutter/material.dart';

class CustomPageRouteScale extends PageRouteBuilder {
  final Widget child;
  CustomPageRouteScale({
    required this.child,
  }) : super(pageBuilder: (context, animation, secondaryAnimation) => child);
  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    return ScaleTransition(
        scale: animation,
        child: child);
  }


}
