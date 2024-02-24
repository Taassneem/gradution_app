import 'package:flutter/material.dart';

class CustomAuthAppBar extends StatelessWidget {
  const CustomAuthAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back))
        ],
      ),
    );
  }
}
