import 'package:flutter/material.dart';

import 'components/categorieslist.dart';

class ManageCategories extends StatefulWidget {
  const ManageCategories({Key? key}) : super(key: key);

  @override
  State<ManageCategories> createState() => _ManageCategoriesState();
}

class _ManageCategoriesState extends State<ManageCategories> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child:  Scaffold(
        body: CategoryList(),
      ),
    );
  }
}
