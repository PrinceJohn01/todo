import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/logic/size_utils.dart';
import 'package:todo/screens/todo_page/widgets/todos_item_widget.dart';

import '../../logic/app_bar/appbar_title.dart';
import '../../logic/app_bar/appbar_trailing_image.dart';
import '../../logic/app_bar/custom_app_bar.dart';
import '../../logic/custom_floating_button.dart';
import '../../logic/custom_image_view.dart';
import '../../logic/image_constant.dart';
import '../add_todo_screen/add_todo_screen.dart';
import '../todo.dart';

class TodoPage extends StatelessWidget {
  TodoPage({super.key});
  final TodoController todoController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.grey[300],
            appBar: CustomAppBar(
                title: AppbarTitle(
                    text: "TODO APP", margin: EdgeInsets.only(left: 19.h)),
                actions: [
                  AppbarTrailingImage(
                      imagePath: ImageConstant.imgVector,
                      margin: EdgeInsets.fromLTRB(21.h, 17.v, 21.h, 25.v))
                ],
                styleType: Style.bgFill),
            body: Container(
                width: double.maxFinite,
                decoration: const BoxDecoration(color: Color(0XFFD6D7EF)),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  SizedBox(height: 22.v),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7.h),
                    child: Obx(
                      () => SizedBox(
                        height:
                            1000, // Adjust the height according to your requirement

                        child: ListView.builder(
                          itemCount: todoController.todos.length,
                          itemBuilder: (context, index) {
                            var todo = todoController.todos[index];
                            return Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: TodosItemWidget(todo: todo),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const Spacer()
                ])),
            floatingActionButton: CustomFloatingButton(
                height: 70,
                width: 70,
                onTap: () {
                  Get.to(AddTodoScreen());
                },
                backgroundColor: const Color(0XFF9395D3),
                child: CustomImageView(
                    imagePath: ImageConstant.imgPlus,
                    height: 35.0.v,
                    width: 35.0.h))));
  }
}
