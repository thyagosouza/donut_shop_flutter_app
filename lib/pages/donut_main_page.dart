import 'package:donut_shop_app/core/core.dart';
import 'package:donut_shop_app/models/donut_list.dart';
import 'package:donut_shop_app/services/donut_service.dart';
import 'package:donut_shop_app/widgets/donut_filter_bar_widget.dart';
import 'package:donut_shop_app/widgets/donut_pager_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class DonutMainPage extends StatelessWidget {
  const DonutMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        DonutPager(),
        DonutFilterBarWidget(),
        Expanded(
          child: Consumer<DonutService>(
            builder: (context, donutService, child) {
              return DonutList(
                donuts: donutService.filteredDonuts,
              );
            },
          ),
          // child: DonutList(
          //   donuts: Utils.donuts,
        ),
      ],
    );
  }
}
