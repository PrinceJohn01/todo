import 'package:flutter/material.dart';
import 'package:todo/logic/size_utils.dart';

import '../../../theme/app_decoration.dart';
import '../../../theme/theme_helper.dart';
import '../../todo.dart';

// ignore: must_be_immutable
class CompletedtaskItemWidget extends StatelessWidget {
  final Todo todo;

  const CompletedtaskItemWidget({super.key, required this.todo});

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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }
}
