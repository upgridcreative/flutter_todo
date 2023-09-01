import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../repository/category.dart';
import '../../../shared/datepicker/datePicker.dart';
import '../../../shared/functions/date_functions.dart';
import '../../../shared/theme/light.dart';
import '../../../view_model/home_page.dart';

class AddTodoSheet extends StatefulHookWidget {
  const AddTodoSheet({Key? key}) : super(key: key);

  @override
  State<AddTodoSheet> createState() => _AddTodoSheetState();
}

class _AddTodoSheetState extends State<AddTodoSheet> {
  final HomePageViewModel viewModel = Get.find();
  final CategoryRepository categoryRepository = Get.find();

  DateTime? _datePicked;
  String? categoryDropDownValue;

  @override
  Widget build(BuildContext context) {
    final contextTextEditingController = useTextEditingController();

    final descriptionTextEditingController = useTextEditingController();
    return Container(
      color: const Color(0xFFD2D3DB),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      height: 250,
      child: Column(
        children: [
          TextField(
            controller: contextTextEditingController,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
              letterSpacing: 1.5,
              color: Colors.black,
            ),
            autofocus: true,
            decoration: InputDecoration(
              hintStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
                color: Colors.black.withOpacity(.8),
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
              color: Colors.black87,
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
                color: Colors.black.withOpacity(.87),
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
                      onSaved: _selectDate,
                    ),
                    context: context,
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 5),
                  height: 50,
                  decoration: BoxDecoration(
                    color: false ? mainColor : const Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    _datePicked == null
                        ? 'No Date'
                        : convertDueDateToName(
                            dateFormatter.format(_datePicked!),
                          ),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: false ? Colors.white : Colors.black,
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
                    color: true ? mainColor : const Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    'All',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: true ? Colors.white : Colors.black,
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
                          color: true ? mainColor : const Color(0xFFEEEEEE),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          categoryDropDownValue ?? 'All',
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
                  color: mainColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  color: Colors.white.withOpacity(.9),
                  onPressed: () {
                    if (contextTextEditingController.text == '') {
                      return;
                    }
                    viewModel.addTaskFromScratch(
                      contextTextEditingController.text,
                      description: descriptionTextEditingController.text,
                      categoryTempId: categoryDropDownValue,
                      dueDate: _datePicked,
                    );
                    contextTextEditingController.clear();
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

  _selectDate(newDate) {
    _datePicked = newDate;
    setState(() {});
  }

  _setCategoryDropDownValue(newValue) {
    categoryDropDownValue = newValue;
    setState(() {});
  }
}
