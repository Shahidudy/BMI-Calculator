import 'package:flutter/material.dart';

import '../constant/app_constant.dart';

class LeftBar extends StatelessWidget {
  final double barWidth;
  const LeftBar({super.key, required this.barWidth});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: barWidth,
          height: 25,
          decoration: BoxDecoration(
              color: yellowColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20))),
        ),
      ],
    );
  }
}
