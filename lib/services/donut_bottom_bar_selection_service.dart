import 'package:donut_shop_app/core/core.dart';
import 'package:flutter/material.dart';

class DonutBottomSelectionService extends ChangeNotifier {
  String? tabSelection = "main";

  void setTabSelection(String selection) {
    Utils.mainListNav.currentState!.pushReplacementNamed("/$selection");
    tabSelection = selection;
    notifyListeners();
  }
}
