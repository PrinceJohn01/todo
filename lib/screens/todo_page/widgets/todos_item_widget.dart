import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/logic/size_utils.dart';

import '../../../logic/custom_image_view.dart';
import '../../../logic/image_constant.dart';
import '../../../theme/app_decoration.dart';
import '../../../theme/theme_helper.dart';
import '../../edit_todo_screen/edit_todo_screen.dart';
import '../../todo.dart';

// ignore: must_be_immutable
class TodosItemWidget extends StatelessWidget {
  final Todo todo;
  final TodoController todoController = Get.find<TodoController>();
  TodosItemWidget({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {
    int todoIndex = todoController.todos.indexOf(todo);
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 19.h,
            vertical: 21.v,
          ),
          decoration: AppDecoration.outlinePrimary.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder15,
          ),
          child: Row(
            children: [
              Column(
                children: [
                  Text(
                    todo.title,
                    style: theme.textTheme.labelLarge,
                  ),
                  SizedBox(height: 4.v),
                  Text(
                    todo.detail,
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
              const Spacer(),
              CustomImageView(
                imagePath: ImageConstant.imgEdit,
                height: 25.adaptSize,
                width: 25.adaptSize,
                margin: EdgeInsets.only(
                  top: 7.v,
                  bottom: 6.v,
                ),
                onTap: () {
                  Get.to(EditTodoScreen(todo: todo));
                },
              ),
              CustomImageView(
                imagePath: ImageConstant.imgThumbsUp,
                height: 25.adaptSize,
                width: 25.adaptSize,
                margin: EdgeInsets.only(
                  left: 20.h,
                  top: 7.v,
                  bottom: 6.v,
                ),
                onTap: () {
                  Get.defaultDialog(
                    title: 'Delete Todo',
                    middleText: 'Are you sure you want to delete this todo?',
                    textConfirm: 'Delete',
                    onConfirm: () {
                      todoController.deleteTodo(todoIndex);
                      Get.back(); // Close the confirmation dialog
                    },
                    onCancel: () {
                      Get.back(); // Close the confirmation dialog
                    },
                  );
                },
              ),
              CustomImageView(
                imagePath: ImageConstant.imgCheckmark,
                height: 25.adaptSize,
                width: 25.adaptSize,
                margin: EdgeInsets.fromLTRB(20.h, 7.v, 6.h, 6.v),
                onTap: () {
                  // Toggle completed status of the todo
                  todoController.toggleCompleted(todoIndex);

                  // Remove the todo from the current page's list
                  if (todoController.todos.length > todoIndex) {
                    todoController.todos.removeAt(todoIndex);
                  }

                  // Add the todo to the completed todos list
                  todoController.completedTodos?.add(todo);

                  todoController.update();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
