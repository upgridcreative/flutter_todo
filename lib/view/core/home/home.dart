import 'package:flutter/material.dart';
import '../../../repository/category.dart';
import '../../../shared/theme/colors.dart';
import '../calander/calander.dart';
import '../../settings/settings.dart';
import '../../../view_model/home_page.dart';
import 'package:get/get.dart';

import '../../../shared/theme/light.dart';
import 'components/body.dart';
import 'components/bottombar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  final HomePageViewModel viewModel = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics:const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: <Widget>[
          HomeBodyComponent(),
          CalendarPage(),
          HomeBodyComponent(),
          SettingsScreen()
        ],
      ),
      bottomNavigationBar: HomeBottomBar(
        onTap: (val) {
          setState(() {
            _currentIndex = val;
          });
          _pageController.jumpToPage(val);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: mainColor,
        onPressed: () => Get.bottomSheet(
          BottomSheet(
            constraints: const BoxConstraints(
              maxHeight: 350,
              minHeight: 200,
            ),
            onClosing: () {},
            builder: (c) {
              return AddTodoSheet();
            },
          ),
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 32,
        ),
      ),
    );
  }
}

class AddTodoSheet extends StatefulWidget {
  AddTodoSheet({Key? key}) : super(key: key);

  @override
  State<AddTodoSheet> createState() => _AddTodoSheetState();
}

class _AddTodoSheetState extends State<AddTodoSheet> {
  final HomePageViewModel viewModel = Get.find();
  final CategoryRepository categoryRepository = Get.find();

  final contextTextEditingController = TextEditingController();

  final descriptionTextEditingController = TextEditingController();

  DateTime? _datePicked;
  String? categoryDropDownValue;

  @override
  Widget build(BuildContext context) {
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
                  final newDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000, 1, 1),
                    lastDate: DateTime(2100, 1, 1),
                  );
                  _selectDate(newDate);
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
                        : _datePicked.toString().substring(0, 7),
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
