import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../repository/category.dart';
import '../../../shared/utils/date_functions.dart';
import '../../../view_model/add_todo_view_model.dart';
import '../../components/datepicker/datePicker.dart';

class AddTodoSheet extends StatefulHookWidget {
  const AddTodoSheet({Key? key}) : super(key: key);

  @override
  State<AddTodoSheet> createState() => _AddTodoSheetState();
}

class _AddTodoSheetState extends State<AddTodoSheet> {
  final CategoryRepository categoryRepository = Get.find();

  String? categoryDropDownValue;

  @override
  Widget build(BuildContext context) {
    final viewModel = Get.put(AddTodoViewModel());
    final descriptionTextEditingController = useTextEditingController();

    return Container(
      color: Theme.of(context).cardColor,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      height: 250,
      child: Column(
        children: [
          TextField(
            controller: viewModel.contextTextEditingController,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
              letterSpacing: 1.5,
              color: Theme.of(context).textTheme.displayMedium?.color,
            ),
            autofocus: true,
            decoration: InputDecoration(
              hintStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
                color: Theme.of(context).textTheme.displaySmall?.color,
              ),
              hintText: 'Eg. Finish Homework',
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
            ),
            textInputAction: TextInputAction.next,
          ),
          TextField(
            controller: descriptionTextEditingController,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: Theme.of(context).textTheme.displaySmall?.color,
              letterSpacing: -.1,
            ),
            maxLines: 3,
            showCursor: true,
            decoration: InputDecoration(
              hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                letterSpacing: -.1,
                wordSpacing: .004,
                color: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.color
                    ?.withOpacity(.6),
              ),
              hintText: 'Description',
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  showModalBottomSheet(
                    enableDrag: true,
                    builder: (context) => CustomDatePicker(
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2050, 01, 01),
                      onDateChanged: (date) {},
                      onSaved: viewModel.selectDate,
                    ),
                    context: context,
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 5),
                  height: 50,
                  decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.secondary.withOpacity(.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Obx(
                    () => Text(
                      viewModel.datePicked.value == null
                          ? 'No Date'
                          : convertDueDateToName(
                              dateFormatter.format(viewModel.datePicked.value!),
                            ),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              DropdownButton(
                items: categoryRepository.categories.map(
                  (element) {
                    return DropdownMenuItem(
                      value: element.tempId.value,
                      child: Text(element.title.value),
                    );
                  },
                ).toList(),
                elevation: 0,
                icon: const SizedBox(),
                underline: const SizedBox(),
                value: categoryDropDownValue,
                onChanged: (value) {
                  _setCategoryDropDownValue(value);
                },
                hint: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  margin: const EdgeInsets.only(right: 5),
                  height: 30,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'All',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                alignment: Alignment.centerLeft,
                selectedItemBuilder: (c) => categoryRepository.categories
                    .map(
                      (element) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        margin: const EdgeInsets.only(right: 5),
                        height: 30,
                        decoration: BoxDecoration(
                          color: true
                              ? Theme.of(context).primaryColor
                              : const Color(0xFFEEEEEE),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          element.title.value,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  color: Colors.white.withOpacity(.9),
                  onPressed: () {
                    if (viewModel.contextTextEditingController.text == '') {
                      return;
                    }
                    viewModel.addTaskFromScratch(
                      viewModel.contextTextEditingController.text,
                      description: descriptionTextEditingController.text,
                      categoryTempId: categoryDropDownValue,
                      dueDate: viewModel.datePicked.value,
                    );
                    viewModel.contextTextEditingController.clear();
                    descriptionTextEditingController.clear();

                    Get.back();
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  _setCategoryDropDownValue(newValue) {
    categoryDropDownValue = newValue;
    setState(() {});
  }
}
