import 'task.dart';
import '../../repository/category.dart';
import '../../shared/functions/date_functions.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  // final box = Hive.box('tasks');
  late Task hiveInstance;

  late Rx<String> tempId;
  late Rx<String> content;
  late Rx<bool> isChecked;

  Rxn<String> description = Rxn<String>();
  Rxn<String> parentTempId = Rxn<String>();
  Rxn<String> categoryTempId = Rxn<String>();
  Rxn<String> due = Rxn<String>();

  Rxn<int> childOrder = Rxn<int>();

  TaskController({
    required this.tempId,
    required this.content,
    required this.isChecked,
    description,
    parentTempId,
    categoryTempId,
    due,
    childOrder,
  }) {
    this.description.value = description;
    this.parentTempId.value = parentTempId;
    this.categoryTempId.value = categoryTempId;
    this.due.value = due;
    this.childOrder.value = childOrder;
  }

  TaskController.fromHive(
    this.hiveInstance,
    String tempId,
    String content,
    bool isChecked,
    String? description,
    String? parentTempId,
    String? categoryTempId,
    String? due,
    int? childOrder,
  ) {
    this.tempId = RxString(tempId);
    this.content = RxString(content);
    this.isChecked = RxBool(isChecked);

    this.description.value = description;
    this.parentTempId.value = parentTempId;
    this.categoryTempId.value = categoryTempId;
    this.due.value = due;
    this.childOrder.value = childOrder;
  }

  Task get hive => hiveInstance;

  void updateTask(String content) {
    this.content.value = content;

    hiveInstance.content = content;
    hiveInstance.save();


    update(); // Update the User interface
  }

  void updateDescription(String description) {
    this.description.value = description;

    hiveInstance.description = description;
    hiveInstance.save();


    update(); // Update the User interface
  }

  void setCategory(String tempId) {
    categoryTempId(tempId);

    hiveInstance.categoryTempId = tempId;
    hiveInstance.save();

    update();
  }

  void removeCategory() {
    categoryTempId.value = null;

    hiveInstance.categoryTempId = null;
    hiveInstance.save();
    update();
  }

  void setDueDate(DateTime? newDate) {
    final formattedDate =
        newDate == null ? null : dateFormatter.format(newDate);

    due.value = formattedDate;

    hive.due = formattedDate;
    hiveInstance.save();

    update();
  }

  bool get isDue {
    final now = DateTime.now();

    return DateTime.parse(due.value!).isAtSameMomentAs(
      DateTime(now.year, now.month, now.day),
    );
  }
  
  String get category {

    if (categoryTempId.value == null) {
      return '';
    }
    final CategoryRepository repo = Get.find();

    return repo.getCategoryByTempId(categoryTempId.value!).title.value;
  }
}
