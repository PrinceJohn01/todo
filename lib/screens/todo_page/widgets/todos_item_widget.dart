import 'package:flutter/material.dart';
import 'package:todo/core/app_export.dart';

// ignore: must_be_immutable
class TodosItemWidget extends StatelessWidget {
  TodosItemWidget({
    Key? key,
    this.onTapImgTODOTITLE,
  }) : super(
          key: key,
        );

  VoidCallback? onTapImgTODOTITLE;

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
                "TODO TITLE",
                style: theme.textTheme.labelLarge,
              ),
              SizedBox(height: 4.v),
              Text(
                "TODO SUB TITLE",
                style: theme.textTheme.bodySmall,
              ),
            ],
          ),
          Spacer(),
          CustomImageView(
            imagePath: ImageConstant.imgEdit,
            height: 25.adaptSize,
            width: 25.adaptSize,
            margin: EdgeInsets.only(
              top: 7.v,
              bottom: 6.v,
            ),
            onTap: () {
              onTapImgTODOTITLE!.call();
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
