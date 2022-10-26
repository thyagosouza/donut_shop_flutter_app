import 'package:donut_shop_app/core/core.dart';
import 'package:donut_shop_app/models/donut_filter_bar_item_model.dart';
import 'package:donut_shop_app/models/donut_model.dart';
import 'package:flutter/material.dart';

class DonutService extends ChangeNotifier {
  List<DonutFilterBarItemModel> filterBarItems = [
    DonutFilterBarItemModel(id: 'classic', label: 'Classic'),
    DonutFilterBarItemModel(id: 'sprinkled', label: 'Sprinkled'),
    DonutFilterBarItemModel(id: 'stuffed', label: 'Stuffed'),
  ];
  String? selectedDonutType;
  List<DonutModel> filteredDonuts = [];

  late DonutModel selectedDonut;

  DonutModel getSelectedDonut() {
    return selectedDonut;
  }

  void onDonutSelected(DonutModel donut) {
    selectedDonut = donut;
    Utils.mainAppNav.currentState!.pushNamed("/details");
  }

  DonutService() {
    selectedDonutType = filterBarItems.first.id;
    filteredDonutsByType(selectedDonutType!);
  }

  void filteredDonutsByType(String type) {
    selectedDonutType = type;
    filteredDonuts =
        Utils.donuts.where((d) => d.type == selectedDonutType).toList();

    notifyListeners();
  }
}
