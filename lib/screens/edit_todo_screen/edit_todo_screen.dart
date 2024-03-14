import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/logic/size_utils.dart';

import '../../logic/app_bar/appbar_title.dart';
import '../../logic/app_bar/custom_app_bar.dart';
import '../../logic/custom_elevated_button.dart';
import '../../logic/custom_text_form_field.dart';
import '../todo.dart';

class EditTodoScreen extends StatefulWidget {
  final TodoController todoController = Get.find();
  final Todo todo;

  EditTodoScreen({super.key, required this.todo});

  @override
  _EditTodoScreenState createState() => _EditTodoScreenState();
}

class _EditTodoScreenState extends State<EditTodoScreen> {
  late TextEditingController titleController;
  late TextEditingController detailController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.todo.title);
    detailController = TextEditingController(text: widget.todo.detail);
  }

  @override
  void dispose() {
    titleController.dispose();
    detailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: CustomAppBar(
          leadingWidth: 51.h,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_outlined,
                color: Colors.white,
                size: 42,
              )),
          title: AppbarTitle(
            text: "Edit Task",
            margin: EdgeInsets.only(left: 37.h),
          ),
          styleType: Style.bgFill,
        ),
        body: Container(
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
                        int index =
                            widget.todoController.todos.indexOf(widget.todo);
                        widget.todoController
                            .editTodo(index, newTitle, newDetail);
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
        ),
      ),
    );
  }
}
