import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../shared/theme/decoration.dart';
import '../../../../shared/theme/light.dart';
import '../../../../view_model/category_view_model.dart';
import '../../../components/appbar.dart';
import '../../../components/custom_short_button.dart';
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
                        color: Theme.of(context)
                            .colorScheme
                            .secondary
                            .withOpacity(0.6),
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
                                return Material(
                                  color: Colors.transparent,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).cardColor,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: 30,
                                        ),
                                        padding: const EdgeInsets.all(20),
                                        width: double.infinity,
                                        height: 150,
                                        child: Column(children: [
                                          TextField(
                                            autofocus: true,
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium
                                                  ?.color,
                                              letterSpacing: 1,
                                            ),
                                            controller: titleController,
                                            decoration:
                                                textFieldDecoration.copyWith(
                                              hintText: "e.g. Personal,work",
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text(
                                                  "Cancel",
                                                  style: subTitle.copyWith(
                                                    color: Theme.of(context)
                                                        .textTheme
                                                        .displaySmall
                                                        ?.color,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              CustomShortButton(
                                                onPressed: () {
                                                  if (titleController
                                                      .text.isEmpty) {
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
                                                customTextStyle:
                                                    subTitle.copyWith(
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                        ]),
                                      ),
                                      SizedBox(height: size.height / 3)
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.add,
                                color: Theme.of(context).primaryColor,
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
