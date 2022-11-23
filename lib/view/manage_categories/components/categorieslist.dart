import 'package:flutter/material.dart';
import 'package:flutter_todo/constants/decoration.dart';
import 'package:flutter_todo/shared/theme/colors.dart';

import '../../../model/category.dart';
import '../../../shared/components/customProceedButton.dart';
import '../../../shared/components/custom_short_button.dart';
import 'categoriestile.dart';

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
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: ColorClass.grey,
                      actionsPadding: EdgeInsets.only(right: 12),
                      title: Text("Create new Category"),
                      content: TextFormField(
                          decoration: textFieldDecoration.copyWith(
                              hintText: "e.g. Personal,work")),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Cancel",
                                    style: subTitle.copyWith(
                                      color: ColorClass.black70,
                                    ))),
                            SizedBox(
                              width: 10,
                            ),
                            CustomShortButton(
                              title: 'Save',
                              heightFactor: 0.25,
                              customTextStyle:
                                  subTitle.copyWith(color: Colors.white),
                            )
                          ],
                        )
                      ],
                    );
                  },
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.add),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text("Create New", style: subTitle),
                  ),
                ],
              ),
            ),
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
