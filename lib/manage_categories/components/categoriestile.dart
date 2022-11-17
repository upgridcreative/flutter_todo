import 'package:flutter/material.dart';
import 'package:flutter_todo/constants/decoration.dart';
import 'package:flutter_todo/constants/lists.dart';
import 'package:flutter_todo/home/components/components.dart';

import '../../models/category.dart';

class CategoriesTile extends StatelessWidget {
  final Color color;
  final Category category;
  const CategoriesTile({Key? key, required this.color, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height*0.1,
      padding: EdgeInsets.all(12),
      margin:EdgeInsets.all(8),
      key: Key(category.id.toString()),
      child: Row(
        children: [
          Text(
            "Category Name",
            style: midTitle,
          ),
          Spacer(),
          Text("12",
            style: midTitle,
          ),HomeComponent.popUpButton(categoryList)
        ],
      ),
      decoration: BoxDecoration(borderRadius: borderRadius,color:color,),
    );
  }
}
