import 'package:flutter/material.dart';
import 'package:todo/logic/size_utils.dart';

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    super.key,
    this.alignment,
    this.backgroundColor,
    this.onTap,
    this.width,
    this.height,
    this.decoration,
    this.child,
  });

  final Alignment? alignment;

  final Color? backgroundColor;

  final VoidCallback? onTap;

  final double? width;

  final double? height;

  final BoxDecoration? decoration;

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: fabWidget,
          )
        : fabWidget;
  }

  Widget get fabWidget => FloatingActionButton(
        backgroundColor: backgroundColor,
        onPressed: onTap,
        child: Container(
          alignment: Alignment.center,
          width: width ?? 0,
          height: height ?? 0,
          decoration: decoration ??
              BoxDecoration(
                color: const Color(0XFF9395D3),
                borderRadius: BorderRadius.circular(35.h),
              ),
          child: child,
        ),
      );
}
