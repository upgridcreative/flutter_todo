import 'package:flutter/material.dart';

import '../../../constants/decoration.dart';
import '../../../constants/lists.dart';
import '../../../model/category.dart';
import '../../home/components/components.dart';


class CategoriesTile extends StatelessWidget {
  final Color color;
  final Category category;
  const CategoriesTile({Key? key, required this.color, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 54,
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.all(8),
      key: Key(category.id.toString()),
      child: Row(
        children: [
          Text(
            "Category Name",
            style: midTitle,
          ),
          const Spacer(),
          Text(
            "12",
            style: midTitle,
          ),
          HomeComponent.popUpButton(categoryList)
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        color: color,
      ),
    );
  }
}
