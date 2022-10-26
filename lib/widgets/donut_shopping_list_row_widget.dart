import 'package:donut_shop_app/core/core.dart';
import 'package:donut_shop_app/models/donut_model.dart';
import 'package:flutter/material.dart';

class DonutShoppingListRowWidget extends StatelessWidget {
  DonutModel? donut;
  Function? onDeleteRow;
  DonutShoppingListRowWidget({this.donut, this.onDeleteRow});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10, right: 20),
        child: Row(children: [
          Image.network('${donut!.imgUrl}', width: 80, height: 80),
          SizedBox(width: 10),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text('${donut!.name}',
                    style: TextStyle(
                        color: AppColors.mainDark,
                        fontSize: 15,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Container(
                  padding:
                      EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          width: 2,
                          color: AppColors.mainDark.withOpacity(0.2))),
                  child: Text('\$${donut!.price!.toStringAsFixed(2)}',
                      style: TextStyle(
                          color: AppColors.mainDark.withOpacity(0.4),
                          fontWeight: FontWeight.bold)),
                )
              ])),
          SizedBox(width: 10),
          IconButton(
              onPressed: () {
                onDeleteRow!();
              },
              icon: Icon(Icons.delete_forever, color: AppColors.mainColor))
        ]));
  }
}
