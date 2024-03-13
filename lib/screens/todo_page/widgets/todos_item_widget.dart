import 'package:flutter/material.dart';
import 'package:todo/logic/size_utils.dart';

import '../../../logic/custom_image_view.dart';
import '../../../logic/image_constant.dart';
import '../../../theme/app_decoration.dart';
import '../../../theme/theme_helper.dart';
import '../../todo.dart';

// ignore: must_be_immutable
class TodosItemWidget extends StatelessWidget {
  final Todo todo;
  const TodosItemWidget({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            onTap: () {},
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
          ),
          CustomImageView(
            imagePath: ImageConstant.imgCheckmark,
            height: 25.adaptSize,
            width: 25.adaptSize,
            margin: EdgeInsets.fromLTRB(20.h, 7.v, 6.h, 6.v),
          ),
        ],
      ),
    );
  }
}
