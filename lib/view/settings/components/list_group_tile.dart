import 'package:flutter/material.dart';

class ListGroupTitle extends StatelessWidget {
  final String title;
  final double paddingtop;
  const ListGroupTitle(this.title, {this.paddingtop = 30});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, top: paddingtop),
      child: Text(
        title,
        style: TextStyle(
          color:
              Theme.of(context).textTheme.displayLarge?.color ?? Colors.black,
          fontFamily: 'Montserrat',
          fontSize: 21,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
