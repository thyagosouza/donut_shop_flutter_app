import 'package:donut_shop_app/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PageViewIndicatorWidget extends StatelessWidget {
  PageController? controller;
  int? numberOfPages;
  int? currentPage;
  PageViewIndicatorWidget({
    this.controller,
    this.numberOfPages,
    this.currentPage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(numberOfPages!, (index) {
        return GestureDetector(
          onTap: () {
            controller!.animateToPage(index,
                duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            width: 15,
            height: 15,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: currentPage == index
                  ? AppColors.mainColor
                  : AppColors.grey.withOpacity(0.2),
            ),
          ),
        );
      }),
    );
  }
}
