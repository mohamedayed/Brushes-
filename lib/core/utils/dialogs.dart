import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppDialogs {
  static Future<T?> showAppDialog<T>(BuildContext context, {bool barrierDismissible = true, required Widget dialog}) {
    return Platform.isIOS
        ? showCupertinoDialog(context: context, barrierDismissible: barrierDismissible, builder: (context) => dialog)
        : showDialog(context: context, barrierDismissible: barrierDismissible, builder: (context) => dialog);
  }
}
