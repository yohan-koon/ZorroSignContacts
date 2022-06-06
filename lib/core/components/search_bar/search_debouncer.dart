import 'dart:async';

import 'package:flutter/widgets.dart';

class SearchDebouncer {
  final int milliseconds;
  VoidCallback? action;
  Timer? timer;

  SearchDebouncer(
      {required this.milliseconds, this.action, this.timer});

  run(VoidCallback action) {
    if (timer != null ) {
      timer?.cancel();
    }
    timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
