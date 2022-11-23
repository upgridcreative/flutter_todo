import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_todo/shared/components/appbar.dart';

import '../home/components/components.dart';
import 'components/categorieslist.dart';

class ManageCategories extends StatefulWidget {
  const ManageCategories({Key? key}) : super(key: key);

  @override
  State<ManageCategories> createState() => _ManageCategoriesState();
}

class _ManageCategoriesState extends State<ManageCategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        children: [
          MyAppBar(title: 'Manage Category',),
          const CategoryList(),
        ],
      ),
    );
  }
}
