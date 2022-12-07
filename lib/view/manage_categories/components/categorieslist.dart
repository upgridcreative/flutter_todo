import 'package:flutter/material.dart';
import 'package:flutter_todo/constants/decoration.dart';
import 'package:flutter_todo/shared/components/appbar.dart';
import 'package:flutter_todo/shared/theme/colors.dart';
import 'package:flutter_todo/shared/theme/light.dart';

import '../../../model/category.dart';
import '../../../shared/components/custom_short_button.dart';
import 'categoriestile.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int category = 10;
    return Column(
      children: [
        const SizedBox(
          height: 50,
          child: MyAppBar(title: 'Manage Catagories'),
        ),
        const SizedBox(height: 30),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  itemCount: category + 1,
                  itemBuilder: (BuildContext context, int index) {
                    return CategoriesTile(
                      key: Key(index.toString()),
                      category: Category(id: index),
                      color: lightGreen.withOpacity(0.6),
                    );
                  },
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        top: 10,
                      ),
                      child: InkWell(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: ColorClass.grey,
                                actionsPadding:
                                    const EdgeInsets.only(right: 12),
                                title: const Text("Create new Category"),
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
                                        child: Text(
                                          "Cancel",
                                          style: subTitle.copyWith(
                                            color: ColorClass.black70,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      CustomShortButton(
                                        title: 'Save',
                                        heightFactor: 0.25,
                                        customTextStyle: subTitle.copyWith(
                                            color: Colors.white),
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
                            const Icon(
                              Icons.add,
                              color: mainColor,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text("Create New", style: subTitle),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Text(
                      "Long Press To Drag",
                      style: subTitle.copyWith(
                        color: Colors.black.withOpacity(0.4),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Text("Long Press To Drag",
                    style:
                        subTitle.copyWith(color: Colors.black.withOpacity(0.4)))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
