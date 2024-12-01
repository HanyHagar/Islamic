// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:islamic_app/Cubit/cubit.dart';

class CustomBottomAppBarItem extends StatelessWidget {
  final int index;
  final String image;
  final String label;
  final void Function() onTap; // Updated type

  const CustomBottomAppBarItem({
    super.key,
    required this.index,
    required this.image,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);

    // Determine if this item is selected
    bool isSelected = index == appCubit.currentScreen;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            color: isSelected
                ? appCubit.isLight ?Colors.black:appCubit.selectBottomItemAppBar
                : appCubit.unSelectBottomItemAppBar,
            height: isSelected ? 35 : 30,
            width: isSelected ? 40 : 30,
          ),
          if (isSelected)
            Text(
              label,
              style: TextStyle(
                color: appCubit.isLight?Colors.black:appCubit.selectBottomItemAppBar,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            ),
        ],
      ),
    );
  }
}
