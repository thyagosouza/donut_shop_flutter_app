import 'package:donut_shop_app/core/core.dart';
import 'package:donut_shop_app/models/donut_filter_bar_item_model.dart';
import 'package:donut_shop_app/services/donut_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DonutFilterBarWidget extends StatelessWidget {
  const DonutFilterBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Consumer<DonutService>(
        builder: (context, donutService, child) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children:
                    List.generate(donutService.filterBarItems.length, (index) {
                  DonutFilterBarItemModel item =
                      donutService.filterBarItems[index];

                  return GestureDetector(
                    onTap: () {
                      donutService.filteredDonutsByType(item.id!);
                    },
                    child: Container(
                      child: Text(
                        "${item.label}",
                        style: TextStyle(
                          color: donutService.selectedDonutType == item.id
                              ? AppColors.mainColor
                              : AppColors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(
                height: 10,
              ),
              Stack(
                children: [
                  AnimatedAlign(
                    alignment:
                        alignmentBasedOnTap(donutService.selectedDonutType),
                    duration: Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3 - 20,
                      height: 5,
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Alignment alignmentBasedOnTap(filterBarId) {
    switch (filterBarId) {
      case "classic":
        return Alignment.centerLeft;
      case "sprinkled":
        return Alignment.center;
      case "stuffed":
        return Alignment.centerRight;
      default:
        return Alignment.centerLeft;
    }
  }
}
