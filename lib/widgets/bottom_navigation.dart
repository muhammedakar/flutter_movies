import 'package:flutter/material.dart';

import '../constants/color_constants.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List icons = <IconData>[
      Icons.home_rounded,
      Icons.play_circle_fill_rounded,
      Icons.search,
      Icons.person_outline,
    ];
    return BottomNavigationBar(
          items: List.generate(
              icons.length,
              (index) => BottomNavigationBarItem(
                  backgroundColor: Clr.black,
                  icon: Icon(
                    icons[index],
                    size: 28,
                    color: Clr.white,
                  ),
                  label: "",
                  activeIcon: Icon(
                    icons[index],
                    color: Clr.red,
                    size: 28,
                  ))));
  }
}