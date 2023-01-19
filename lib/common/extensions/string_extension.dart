import 'package:flutter/cupertino.dart';

import '../../presentation/app_localization.dart';

extension StringExtension on String {

  String intelliTrim(){
    return length>15? '${substring(0,15)}...':this;
  }

  String t (BuildContext context)
  {
    return AppLocalisations.of(context).translate(this);
  }

}