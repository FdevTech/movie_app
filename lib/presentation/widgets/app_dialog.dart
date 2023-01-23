
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/presentation/themes/theme_text.dart';

import '../../common/constants/size_contants.dart';
import '../themes/app_colors.dart';
import 'button.dart';

class AppDialog extends StatelessWidget {
  final String title, description;
  Widget? child;
  AppDialog({Key? key,
     required this.title,
     required this.description,
     this.child
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColor.vulcan,
      elevation: Sizes.dimen_32,
      insetPadding: EdgeInsets.all(Sizes.dimen_8.w),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(Sizes.dimen_8.w)
          )
      ),
      child: Container(
        padding: EdgeInsets.only(
          top: Sizes.dimen_4.h,
          left: Sizes.dimen_16.w,
          right: Sizes.dimen_16.w
        ),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: AppColor.vulcan,
              blurRadius: Sizes.dimen_16
            )
          ]
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: Theme.of(context).textTheme.headline5,),
            Padding(padding: EdgeInsets.symmetric(vertical: Sizes.dimen_6.h),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.whiteBodyText2,
            ),
            ),
            if(child!=null)child!,
            Button(
              onPressed: (){
                  Navigator.of(context).pop();
              },
              text: "Ok",
            )
          ],
        ),
      ) ,
    );
  }
}
