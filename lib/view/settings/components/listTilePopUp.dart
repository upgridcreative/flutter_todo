import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../shared/theme/colors.dart';

class CustomListTileWithSubtitle extends StatelessWidget {
  const CustomListTileWithSubtitle({
    Key? key,
    required this.text,
    required this.subText,
    required this.values,
    required this.selectedValue,
    required this.onSelectOption,
  }) : super(key: key);

  final String text;
  final String subText;
  final List<String> values;
  final RxString Function() selectedValue;

  final onSelectOption;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showDialog(
        context: context,
        builder: ((context) => CustomValueSelectPopUpDialog(
              values: values,
              parentTitle: text,
              currentValue: selectedValue,
              onValueSelected: onSelectOption,
            )),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 17,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                color: Theme.of(context).textTheme.displayMedium?.color ??
                    Colors.black,
              ),
            ),
            Text(
              subText,
              style: TextStyle(
                fontSize: 14,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w400,
                color: Theme.of(context).textTheme.displaySmall?.color ??
                    Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomValueSelectPopUpDialog extends StatelessWidget {
  const CustomValueSelectPopUpDialog({
    Key? key,
    required this.values,
    required this.parentTitle,
    required this.currentValue,
    required this.onValueSelected,
  }) : super(key: key);

  final List<String> values;
  final String parentTitle;
  final RxString Function() currentValue;
  final onValueSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(10),
          ),
          constraints: BoxConstraints(
            maxHeight: Get.height * .1.sp * values.length,
            maxWidth: Get.width * .8,
          ),
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, bottom: 30),
                child: Text(
                  parentTitle,
                  style:  TextStyle(
                    fontSize: 18,
                    color: Theme.of(context).textTheme.displayMedium?.color,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: values
                      .map(
                        (value) => GestureDetector(
                          onTap: () => onValueSelected(value),
                          child: Center(
                            child: Obx(
                              () => Row(
                                children: [
                                  const SizedBox(width: 20),
                                  Icon(
                                    currentValue() == value
                                        ? Icons.circle
                                        : Icons.circle_outlined,
                                    color: currentValue() == value
                                        ? ColorClass.primary
                                        : null,
                                  ),
                                  const SizedBox(width: 20),
                                  Text(
                                    value,
                                    style: TextStyle(
                                      color: currentValue() == value
                                          ? Theme.of(context)
                                              .textTheme
                                              .displayMedium
                                              ?.color
                                          : Theme.of(context)
                                              .textTheme
                                              .displaySmall
                                              ?.color,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 20,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              GestureDetector(
                onTap: Get.back,
                child: SizedBox(
                  height: 40,
                  child: Row(
                    children: const [
                      Spacer(),
                      Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 18,
                          color: ColorClass.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
