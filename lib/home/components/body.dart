import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../theme/light.dart';
import 'components.dart';

class HomeBodyComponent extends StatelessWidget {
  const HomeBodyComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 16),
    child: HomeComponent.getTab(
          text: "All", textColor: Colors.white, color: mainColor),
    );
  }
}