import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'bottom_bar.dart';

class GeneralController extends GetxController {
  int selectedIndex = 0;
  changePage(int d) {
    selectedIndex = d;
    update();
  }

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: "assets/images/img_megaphone.svg",
      title: "All",
      type: BottomBarEnum.all,
    ),
    BottomMenuModel(
      icon: 'assets/images/img_checkmark_blue_gray_400.svg',
      title: "Completed",
      type: BottomBarEnum.completed,
    ),
  ];

  List<Widget> body = [];
}
