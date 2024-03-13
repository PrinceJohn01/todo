import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({super.key, this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: "assets/images/house1.png",
      title: "All",
      type: BottomBarEnum.all,
    ),
    BottomMenuModel(
      icon: 'assets/bottombar/Calendar.svg',
      title: "Completed",
      type: BottomBarEnum.completed,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 89,
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
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  bottomMenuList[index].icon,
                  height: 24,
                  width: 24,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    bottomMenuList[index].title ?? "",
                  ),
                ),
              ],
            ),
            label: '',
          );
        }),
        onTap: (index) {
          selectedIndex = index;
          widget.onChanged?.call(bottomMenuList[index].type);
          setState(() {});
        },
      ),
    );
  }

}

enum BottomBarEnum {
  all,
  completed,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    this.title,
    required this.type,
  });

  String icon;


  String? title;

  BottomBarEnum type;
}
