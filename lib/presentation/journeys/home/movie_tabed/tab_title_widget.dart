import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common/constants/size_contants.dart';
import 'package:movie_app/presentation/themes/app_colors.dart';
import 'package:movie_app/presentation/themes/theme_text.dart';

class TabTitleWidget extends StatelessWidget {
  final String title;
  final Function onTap;
  final bool isSelected;
  const TabTitleWidget({Key? key,
  required this.title,
  required this.isSelected,
  required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border(
          bottom: BorderSide(
            color: isSelected?AppColor.royalBlue:Colors.transparent,
            width: Sizes.dimen_1.h
          )
        )
      ),
      child: Text(
        title,
        style: isSelected?Theme.of(context).textTheme.royalBlueSubtitle2:Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
