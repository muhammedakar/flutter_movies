import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/color_constants.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 100.h,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Image.asset(
                    "assets/logo.png",
                    color: Clr.darkRed,
                    height: 50.h,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: AutoSizeText(
                      "mrakar",
                      style: GoogleFonts.bebasNeue(
                        color: Clr.darkRed,
                      ),
                    ),
                  )
                ],
              ),
              const Icon(
                Icons.account_circle_rounded,
                color: Clr.red,
                size: 35,
              )
            ],
          ),
        ),
      ),
    );
  }
}
