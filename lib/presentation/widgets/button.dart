
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/presentation/themes/app_colors.dart';

import '../../common/constants/size_contants.dart';

class Button extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  const Button({Key? key,
    required this.text,
    required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      margin: EdgeInsets.symmetric(vertical: 12.h),
      height: 40.h,
       decoration: BoxDecoration(
         gradient: const LinearGradient(colors: [
           AppColor.royalBlue,
           AppColor.violet
         ]),
         borderRadius: BorderRadius.all(
           Radius.circular(Sizes.dimen_20.w)
         ),

       ),
      child: TextButton(onPressed: onPressed,
          child: Text(
            text,
            style: Theme.of(context).textTheme.button,
          )),
    );
  }
}
