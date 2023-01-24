
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/constants/size_contants.dart';

class NavigationSubListItem extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  const  NavigationSubListItem({Key? key,
    required this.title,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Theme.of(context).primaryColor.withOpacity(0.7),
                  blurRadius: 2
              )
            ]
        ),
        child: ListTile(
           contentPadding: EdgeInsets.symmetric(horizontal: Sizes.dimen_32.w),
            title:Text(
              title,
              style: Theme.of(context).textTheme.subtitle1,
            )
        ),
      ),
    );
  }
}