import 'package:flutter/material.dart';

const List popUpList = ["Manage Categories", "Sort By", "Upgrade to Pro"];
const List categoryList = ["Hide", "Delete", "Edit"];
const List settingsList = [
  {"title": "Privacy and Account", "icon": Icons.person},
];
const List homePageList = [
  "Home",
];
const List privacyList = [
  {"title": "Logout", "icon": Icons.logout},
  {
    "title": "Delete account",
  },
];

const List<String> catagories = [
  'My Day',
  'All',
  'Work',
  'Office',
  'Upgrid Creative',
];

const List taskList = [
  {
    "title": "Terms and conditions review with Aprameya",
    "category": "Work",
    "completed": false,
    "due": "Today",
    'isDue': false,
    "subTasks": 1,
    "subTasksCompleted": 0,
  },
  {
    "title": "Help Lakshya with Help4You",
    "category": "",
    "completed": false,
    "due": "Yesterday",
    'isDue': true,
    "subTasks": 0,
  },
  {
    "title": "Finalise Macroservices",
    "category": "",
    "completed": false,
    "due": "",
    'isDue': false,
    "subTasks": 0,
  },
  {
    "title": "Design Review with Client",
    "completed": true,
    "due": "Today",
    'isDue': false,
    "category": 'Office',
    "subTasks": 0,
  }
];
