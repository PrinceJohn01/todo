import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../logic/controller.dart';
import '../logic/size_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: GetBuilder(
            init: GeneralController(),
            builder: (viewModel) {
              return Container(
                child: viewModel.body[viewModel.selectedIndex],
              );
            }),
        bottomNavigationBar: const CustomBottomBar(),
      ),
    );
  }
}

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: GeneralController(),
        builder: (viewModel) {
          return Container(
            height: 68.v,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(
                    0,
                    -0.33,
                  ),
                ),
              ],
            ),
            child: BottomNav(viewModel: viewModel),
          );
        });
  }
}

class BottomNav extends StatelessWidget {
  const BottomNav({
    super.key,
    required this.viewModel,
  });
  final GeneralController viewModel;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.transparent,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedFontSize: 0,
      elevation: 0,
      currentIndex: viewModel.selectedIndex,
      type: BottomNavigationBarType.fixed,
      items: List.generate(viewModel.bottomMenuList.length, (index) {
        return BottomNavigationBarItem(
          icon: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                viewModel.bottomMenuList[index].icon,
                height: 24,
                width: 24,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(viewModel.bottomMenuList[index].title ?? "",
                    style: const TextStyle(
                        fontSize: 11, color: Color(0XFF0D0D0D))),
              ),
            ],
          ),
          label: '',
        );
      }),
      onTap: (d) => viewModel.changePage(d),
    );
  }
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
  });

  String icon;

  String activeIcon;

  String? title;
}
