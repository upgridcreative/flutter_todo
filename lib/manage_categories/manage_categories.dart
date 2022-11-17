import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_todo/home/components/components.dart';
import 'package:flutter_todo/manage_categories/components/categorieslist.dart';

class ManageCategories extends StatefulWidget {
  const ManageCategories({Key? key}) : super(key: key);

  @override
  State<ManageCategories> createState() => _ManageCategoriesState();
}

class _ManageCategoriesState extends State<ManageCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeComponent.simpleAppBar(),
      body: CategoryList(),
    );
  }
}