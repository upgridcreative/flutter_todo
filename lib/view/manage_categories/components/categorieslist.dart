import 'package:flutter/material.dart';
import '../../../constants/decoration.dart';
import '../../../shared/components/appbar.dart';
import '../../../shared/theme/colors.dart';
import '../../../shared/theme/light.dart';
import '../../../view_model/category.dart';
import 'package:get/get.dart';

import '../../../shared/components/custom_short_button.dart';
import 'categoriestile.dart';

class CategoryList extends StatelessWidget {
  CategoryList({Key? key}) : super(key: key);

  final viewModel = CategoryPageViewModel.instance;

  final TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(
          height: 50,
          child: MyAppBar(title: 'Manage Catagories'),
        ),
        const SizedBox(height: 30),
        Obx(
          () => Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    itemCount: viewModel.categories.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CategoriesTile(
                        key: Key(index.toString()),
                        category: viewModel.categories[index],
                        color: lightGreen.withOpacity(0.6),
                      );
                    },
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 25,
                          top: 10,
                        ),
                        child: InkWell(
                          onTap: () {
                            titleController.clear();
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  backgroundColor: Colors.grey,
                                  actionsPadding: const EdgeInsets.only(
                                      right: 12, bottom: 10),
                                  title: const Text("Create new Category"),
                                  content: TextField(
                                    autofocus: true,
                                    style: const TextStyle(
                                        color: Colors.black, letterSpacing: 1),
                                    controller: titleController,
                                    decoration: textFieldDecoration.copyWith(
                                      hintText: "e.g. Personal,work",
                                    ),
                                  ),
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
                                                  color: Colors.black)),
                                        ),
                                        const SizedBox(width: 10),
                                        CustomShortButton(
                                          onPressed: () {
                                            if (titleController.text.isEmpty) {
                                              return;
                                            }
                                            viewModel.addCategory(
                                              titleController.text,
                                            );
                                            titleController.clear();
                                            Get.back();
                                          },
                                          title: 'Save',
                                          heightFactor: 0.25,
                                          customTextStyle: subTitle.copyWith(
                                            color: Colors.white,
                                          ),
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
                      SizedBox(height: size.height * 0.05),
                      Text(
                        "Long Press To Drag",
                        style: subTitle.copyWith(
                          color: Colors.black.withOpacity(0.4),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
