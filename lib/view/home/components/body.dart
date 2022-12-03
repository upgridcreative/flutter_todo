import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_todo/constants/decoration.dart';


import '../../../shared/theme/light.dart';
import 'components.dart';

class HomeBodyComponent extends StatelessWidget {
  const HomeBodyComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      children: [
        HomeComponent.getTab(
              text: "All", textColor: Colors.white, color: mainColor),
             HomeComponent. radioButtonActive(),
             HomeComponent. radioButtonInActive(),
             HomeComponent. divider(),
             Text("Help Lakshya with Help4You",style: noteTitle,),
             Text("Help Lakshya with Help4You",style: noteTitle.copyWith(decoration: TextDecoration.lineThrough
             
             ),), HomeComponent. verticalDivider(),
             Text("Help Lakshya with Help4You",style: noteTag,),
             HomeComponent.clockTitle(title: "Today",color: mainColor,image: "calender.svg"),
                
      ],
    ),
    );
  }
}