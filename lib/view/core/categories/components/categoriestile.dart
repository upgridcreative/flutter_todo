import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../model/category/category_controller.dart';
import '../../../../shared/theme/decoration.dart';
import '../../../../view_model/category_view_model.dart';
import '../../../components/custom_short_button.dart';

class CategoriesTile extends StatefulWidget {
  final Color color;
  final CategoryController category;

  const CategoriesTile({Key? key, required this.color, required this.category})
      : super(key: key);

  @override
  State<CategoriesTile> createState() => _CategoriesTileState();
}

class _CategoriesTileState extends State<CategoriesTile> {
  final CategoryPageViewModel viewModel = Get.find();

  final TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        height: 54,
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          color: widget.color,
        ),
        key: Key(widget.category.tempId.toString()),
        child: Row(
          children: [
            Text(
              widget.category.title.value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.displaySmall?.color,
              ),
            ),
            const Spacer(),
            Text(
              viewModel.getTaskCountOf(widget.category).toString(),
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).textTheme.displaySmall?.color,
                fontWeight: FontWeight.bold,
              ),
            ),
            //!Edit button not showing pop up
            PopupMenuButton(
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.more_vert,
                color: Theme.of(context).textTheme.displaySmall?.color,
              ),
              shape: RoundedRectangleBorder(borderRadius: borderRadius),
              color: Theme.of(context).cardColor,
              itemBuilder: (context) => [
                PopupMenuItem<String>(
                  onTap: () async {
                    await Future.delayed(
                      const Duration(milliseconds: 10),
                    );
                    showDialog(
                      context: context,
                      builder: (context) => EditDialog(
                        category: widget.category,
                        titleController: titleController,
                      ),
                    );
                  },
                  child: InkWell(
                    key: Key(widget.category.tempId.toString()),
                    child: Text(
                      'Edit',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.displayMedium?.color,
                      ),
                    ),
                  ),
                ),
                PopupMenuItem<String>(
                  onTap: () => viewModel.deleteCategory(widget.category),
                  child: Text(
                    'Delete',
                    style: TextStyle(color: Colors.red.withOpacity(.9)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class EditDialog extends StatelessWidget {
  const EditDialog(
      {Key? key, required this.titleController, required this.category})
      : super(key: key);
  final TextEditingController titleController;
  final CategoryController category;

  @override
  Widget build(BuildContext context) {
    final CategoryPageViewModel viewModel = Get.find();

    return AlertDialog(
      backgroundColor: Theme.of(context).cardColor,
      actionsPadding: const EdgeInsets.only(right: 20, bottom: 15),
      title: Text(
        "Edit",
        style: TextStyle(
          color: Theme.of(context).textTheme.displayLarge?.color,
        ),
      ),
      content: TextFormField(
        autofocus: true,
        controller: titleController..text = category.title.value,
        decoration: textFieldDecoration.copyWith(
          contentPadding: EdgeInsets.zero,
          hintText: "New title",
        ),
        style: TextStyle(
          color: Theme.of(context).textTheme.displayMedium?.color,
        )
      ),
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
                  color: Theme.of(context).textTheme.displaySmall?.color,
                ),
              ),
            ),
            const SizedBox(width: 10),
            CustomShortButton(
              onPressed: () {
                if (titleController.text.isEmpty) {
                  return;
                }
                viewModel.updateCategory(
                  titleController.text,
                  category, //Instance
                );
                titleController.clear();
                Get.back();
              },
              title: 'Save',
              heightFactor: 0.25,
              customTextStyle: subTitle.copyWith(color: Colors.white),
            )
          ],
        )
      ],
    );
  }
}
