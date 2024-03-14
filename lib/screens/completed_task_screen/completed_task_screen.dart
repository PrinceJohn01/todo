import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/logic/size_utils.dart';
import 'package:todo/screens/completed_task_screen/widgets/completedtask_item_widget.dart';

import '../../logic/app_bar/appbar_leading_image.dart';
import '../../logic/app_bar/appbar_title.dart';
import '../../logic/app_bar/custom_app_bar.dart';
import '../../logic/image_constant.dart';
import '../../theme/theme_helper.dart';
import '../todo.dart';

class CompletedTaskScreen extends StatelessWidget {
  const CompletedTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Todo> completedTodos =
        Get.find<TodoController>().completedTodos as List<Todo>;
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.gray300,
            appBar: CustomAppBar(
                leadingWidth: 47.h,
                leading: AppbarLeadingImage(
                    imagePath: ImageConstant.imgTurnBackpageButton,
                    margin:
                        EdgeInsets.only(left: 22.h, top: 34.v, bottom: 37.v),
                    onTap: () {
                      Get.back();
                    }),
                title: AppbarTitle(
                    text: "Completed Task",
                    margin: EdgeInsets.only(left: 41.h),
                    onTap: () {}),
                styleType: Style.bgFill),
            body: Padding(
              padding: EdgeInsets.only(left: 7.h, top: 16.v, right: 7.h),
              child: SizedBox(
                height: 1000,
                child: ListView.builder(
                  itemCount: completedTodos.length,
                  itemBuilder: (context, index) {
                    final todo = completedTodos[index];
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CompletedtaskItemWidget(todo: todo),
                    );
                  },
                ),
              ),
            )));
  }
}
