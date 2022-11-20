import 'package:flutter/material.dart';
import 'package:flutter_todo/constants/decoration.dart';
import 'package:flutter_todo/manage_categories/components/categoriestile.dart';
import 'package:flutter_todo/models/category.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.1 * 5,
            child: ReorderableList(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return CategoriesTile(
                  key: Key(index.toString()),
                  category: Category(id: index),
                  color: Colors.red,
                );
              },
              onReorder: (int oldIndex, int newIndex) {},
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text("Create New", style: subTitle),
              ),
            ],
          ),
          SizedBox(
            height: size.height * 0.1,
          ),
          Text("Long Press To Drag", style: subTitle)
        ],
      ),
    );
  }
}
