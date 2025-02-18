// ignore_for_file: deprecated_member_use

import 'package:alarm_app/utils/app_styles.dart';
import 'package:alarm_app/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemSelected;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).width > 600 ? 110 : 66,
      decoration: ShapeDecoration(
          color: CustomColors.clockBG,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ))),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                  context, 0, 'assets/images/clock_icon.png', 'Clock'),
              _buildNavItem(
                  context, 1, 'assets/images/alarm_icon.png', 'Alarm'),
              _buildNavItem(
                  context, 2, 'assets/images/stopwatch_icon.png', 'Stopwatch'),
              _buildNavItem(
                  context, 3, 'assets/images/timer_icon.png', 'Timer'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
      BuildContext context, int index, String img, String title) {
    bool isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () => onItemSelected(index),
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 35, height: 35, child: Image.asset(img)),
            const SizedBox(
              height: 3,
            ),
            FittedBox(
              child: Text(
                title,
                style: AppStyle.styleRegular16(context)
                    .copyWith(color: isSelected ? Colors.lightBlue : Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
