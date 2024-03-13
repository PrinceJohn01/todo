import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/logic/size_utils.dart';

import '../../logic/app_bar/appbar_leading_image.dart';
import '../../logic/app_bar/appbar_title.dart';
import '../../logic/app_bar/custom_app_bar.dart';
import '../../logic/custom_elevated_button.dart';
import '../../logic/custom_text_form_field.dart';
import '../../logic/image_constant.dart';
import '../../theme/theme_helper.dart';
import '../todo.dart';

// ignore_for_file: must_be_immutable
class AddTodoScreen extends StatelessWidget {
  AddTodoScreen({Key? key}) : super(key: key);

  final TodoController todoController = Get.find();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController detailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: CustomAppBar(
                leadingWidth: 51.h,
                leading: AppbarLeadingImage(
                    imagePath: ImageConstant.imgTurnBackpageButton,
                    margin:
                        EdgeInsets.only(left: 26.h, top: 34.v, bottom: 37.v)),
                title: AppbarTitle(
                    text: "Add Task", margin: EdgeInsets.only(left: 37.h)),
                styleType: Style.bgFill),
            body: Container(
                width: double.maxFinite,
                padding: EdgeInsets.symmetric(horizontal: 14.h, vertical: 41.v),
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.h),
                      child: CustomTextFormField(
                          controller: titleController, hintText: "Title")),
                  SizedBox(height: 40.v),
                  Padding(
                      padding: EdgeInsets.only(left: 18.h, right: 12.h),
                      child: CustomTextFormField(
                          controller: detailController,
                          hintText: "Detail",
                          textInputAction: TextInputAction.done)),
                  SizedBox(height: 53.v),
                  CustomElevatedButton(
                      text: "ADD",
                      buttonTextStyle: theme.textTheme.titleLarge!,
                      onPressed: () {
                        String title = titleController.text;
                        String detail = detailController.text;
                        todoController.addTodo(title, detail);
                        Get.back();
                      }),
                  SizedBox(height: 5.v)
                ]))));
  }
}
