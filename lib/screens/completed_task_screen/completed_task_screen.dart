import 'package:todo/widgets/app_bar/custom_app_bar.dart';
import 'package:todo/widgets/app_bar/appbar_leading_image.dart';
import 'package:todo/widgets/app_bar/appbar_title.dart';
import 'widgets/completedtask_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:todo/core/app_export.dart';

class CompletedTaskScreen extends StatelessWidget {
  const CompletedTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: appTheme.gray300,
            appBar: _buildAppBar(context),
            body: Padding(
                padding: EdgeInsets.only(left: 7.h, top: 16.v, right: 7.h),
                child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    shrinkWrap: true,
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 16.v);
                    },
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return CompletedtaskItemWidget();
                    }))));
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
        leadingWidth: 47.h,
        leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgTurnBackpageButton,
            margin: EdgeInsets.only(left: 22.h, top: 34.v, bottom: 37.v),
            onTap: () {
              onTapTurnBackPageButton(context);
            }),
        title: AppbarTitle(
            text: "Completed Task",
            margin: EdgeInsets.only(left: 41.h),
            onTap: () {
              onTapCompletedTask(context);
            }),
        styleType: Style.bgFill);
  }

  /// Navigates to the todoPageContainerScreen when the action is triggered.
  onTapTurnBackPageButton(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.todoPageContainerScreen);
  }

  /// Navigates to the todoPageContainerScreen when the action is triggered.
  onTapCompletedTask(BuildContext context) {
    Navigator.pushNamed(context, AppRoutes.todoPageContainerScreen);
  }
}
