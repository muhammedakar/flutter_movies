import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/color_constants.dart';

class AppBarWid extends StatelessWidget {
  const AppBarWid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            iconButton(
                icon: Icons.arrow_back_ios_new_rounded,
                nav: () => Navigator.pop(context)),
            iconButton(icon: Icons.screen_share_outlined),
          ],
        ),
      ),
    );
  }

  InkWell iconButton({IconData? icon, var nav}) {
    return InkWell(
      onTap: () => nav(),
      child: Container(
        height: 50.w,
        width: 50.w,
        decoration: BoxDecoration(
            color: Clr.black.withOpacity(0.75),
            borderRadius: BorderRadius.circular(15)),
        child: Center(
            child: Icon(
          icon,
          color: Clr.red,
        )),
      ),
    );
  }
}
