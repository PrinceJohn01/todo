import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/completed_task_screen/completed_task_screen.dart';
import '../screens/todo.dart';
import '../screens/todo_page/todo_page.dart';
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

  void navigateToCompletedTaskScreen() {
    Get.to(const CompletedTaskScreen(), arguments: completedTodos);
  }

  List<Todo> completedTodos = [];
  List<Widget> body = [TodoPage(), const CompletedTaskScreen()];
}
