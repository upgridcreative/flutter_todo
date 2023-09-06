import 'package:flutter/material.dart';

import '../../../../shared/enums/prefrences.dart';

Color getColorForSwipeAction(SwipeAction swipeAction) {
  switch (swipeAction) {
    case SwipeAction.check:
      return Colors.blue;
    case SwipeAction.delete:
      return Colors.red;
    case SwipeAction.reschedule:
      return Colors.purple;
    case SwipeAction.nothing:
      return Colors.transparent;
  }
}


IconData getIconForSwipeAction(SwipeAction swipeAction) {
  switch (swipeAction) {
    case SwipeAction.check:
      return Icons.check;
    case SwipeAction.delete:
      return Icons.delete;
    case SwipeAction.reschedule:
      return Icons.date_range;
    case SwipeAction.nothing:
      return Icons.done; // Doesn't matter wont be called anyway
  }
}
