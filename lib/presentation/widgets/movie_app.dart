import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/presentation/themes/app_colors.dart';
import 'package:movie_app/presentation/themes/theme_text.dart';

import '../journeys/home/home.dart';

class MovieApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (context,child){
        return MaterialApp(
          theme: ThemeData(
            primaryColor: AppColor.vulcan,
            scaffoldBackgroundColor: AppColor.vulcan,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: ThemeText.getTextTheme(),
            appBarTheme: const AppBarTheme(elevation: 0,)
          ),
          home: child,
        );

      },
     child : const HomeScreen()
    );

  }

}