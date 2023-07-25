import 'package:flutter/material.dart';
import '../../../../model/category/category_controller.dart';
import '../../../../shared/components/custom_short_button.dart';
import '../../../../shared/theme/colors.dart';
import '../../../../view_model/category.dart';

import '../../../../constants/decoration.dart';
import 'package:get/get.dart';

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
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Text(
              viewModel.getTaskCountOf(widget.category).toString(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            //!Edit button not showing pop up
            PopupMenuButton(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(borderRadius: borderRadius),
              itemBuilder: (context) => [
                PopupMenuItem<String>(
                  child: InkWell(
                    onTap: showEditDilog,
                    child: const Text('Edit'),
                  ),
                ),
                PopupMenuItem<String>(
                  onTap: () => viewModel.deleteCategory(widget.category),
                  child: const Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> showEditDilog() async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: ColorClass.grey,
          actionsPadding: const EdgeInsets.only(right: 12),
          title: const Text("Edit"),
          content: TextFormField(
            controller: titleController..text = widget.category.title.value,
            decoration: textFieldDecoration.copyWith(
              hintText: "New title",
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
                  child: Text(
                    "Cancel",
                    style: subTitle.copyWith(
                      color: ColorClass.black70,
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
                      // Color
                      widget.category, //Instance
                    );
                  },
                  title: 'Save',
                  heightFactor: 0.25,
                  customTextStyle: subTitle.copyWith(color: Colors.white),
                )
              ],
            )
          ],
        );
      },
    );
  }
}
