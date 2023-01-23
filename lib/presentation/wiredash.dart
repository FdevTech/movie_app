import 'package:flutter/material.dart';
import 'package:movie_app/presentation/themes/app_colors.dart';
import 'package:wiredash/wiredash.dart';

class WireDashApp extends StatelessWidget {
  final Widget child;
  //final NavigatorK

  const WireDashApp({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wiredash(

      projectId: "movieapp-e16j8xd",
      secret: "aMa4v8Bs_QIqG3j7RAYgtur8D0JX1eig",
      child: child,
      theme: WiredashThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColor.royalBlue,
        secondaryColor: AppColor.violet,

      ),
    );
  }
}
