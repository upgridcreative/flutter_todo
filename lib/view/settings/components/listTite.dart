import 'package:flutter/material.dart';

import '../../../shared/theme/colors.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final void Function()? navigate;
  final bool showTrailingArrow;
  final Color? iconColor;
  final Color? titleColor;
  final void Function()? onTapHandler;
  const CustomListTile(
    this.title,
    this.icon, {
    super.key,
    this.navigate,
    this.showTrailingArrow = true,
    this.iconColor,
    this.titleColor,
    this.onTapHandler,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: navigate,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.symmetric(
          vertical: showTrailingArrow ? 15 : 25,
          horizontal: 20,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: iconColor ?? ColorClass.primary,
            ),
            const SizedBox(width: 20),
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                color: titleColor ??
                    Theme.of(context).textTheme.displayMedium?.color ??
                    Colors.black,
              ),
            ),
            const Spacer(),
            if (showTrailingArrow)
              IconButton(
                onPressed: () {},
                padding: const EdgeInsets.all(0),
                icon: const Icon(
                  Icons.arrow_forward_ios,
                ),
                color: ColorClass.primary,
              )
          ],
        ),
      ),
    );
  }
}
