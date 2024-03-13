import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/logic/size_utils.dart';

import '../../logic/app_bar/appbar_leading_image.dart';
import '../../logic/app_bar/appbar_title.dart';
import '../../logic/app_bar/custom_app_bar.dart';
import '../../logic/custom_elevated_button.dart';
import '../../logic/custom_text_form_field.dart';
import '../../logic/image_constant.dart';
import '../todo.dart';

class EditTodoScreen extends StatelessWidget {
  final TodoController todoController = Get.find();
  final Todo todo;
  EditTodoScreen({Key? key, required this.todo}) : super(key: key);

  late final TextEditingController titleController;
  late final TextEditingController detailController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          leadingWidth: 51.h,
          leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgTurnBackpageButton,
            margin: EdgeInsets.only(left: 26.h, top: 34.v, bottom: 37.v),
          ),
          title: AppbarTitle(
            text: "Edit Task",
            margin: EdgeInsets.only(left: 37.h),
          ),
          styleType: Style.bgFill,
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            titleController = TextEditingController(text: todo.title);
            detailController = TextEditingController(text: todo.detail);
            return Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 41.v),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.h),
                    child: CustomTextFormField(
                      controller: titleController,
                      hintText: "Title",
                    ),
                  ),
                  SizedBox(height: 40.v),
                  Padding(
                    padding: EdgeInsets.only(left: 18.h, right: 12.h),
                    child: CustomTextFormField(
                      controller: detailController,
                      hintText: "Detail",
                      textInputAction: TextInputAction.done,
                    ),
                  ),
                  SizedBox(height: 53.v),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CustomElevatedButton(
                          text: "Update",
                          margin: EdgeInsets.only(right: 23.h),
                          onPressed: () {
                            String newTitle = titleController.text;
                            String newDetail = detailController.text;
                            int index = todoController.todos.indexOf(todo);
                            todoController.editTodo(index, newTitle, newDetail);
                            Get.back();
                          },
                        ),
                      ),
                      Expanded(
                        child: CustomElevatedButton(
                          text: "Cancel",
                          margin: EdgeInsets.only(left: 23.h),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.v),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
