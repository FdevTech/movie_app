import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/domain/entities/app_erro.dart';
import 'package:movie_app/presentation/blocs/bloc_carousel/movie_carasel_bloc.dart';
import 'package:wiredash/wiredash.dart';

import 'dart:developer' as dev show log;

import '../../common/constants/size_contants.dart';
import 'button.dart';
class AppErrorWidget extends StatelessWidget {
  final AppErrorType appErrorType;
  //final MovieCarouselBloc bloc;
  final void Function() onPress;
  const AppErrorWidget({Key? key,
      required this.appErrorType,
      required this.onPress
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8 .w),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            appErrorType == AppErrorType.api
                ?"something went wrong"
                :"Please check your network connection and press"
                "Retry button or put in as a bug by pressing"
                "Feedback button",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          ButtonBar(
            children: [
              Button(text: "Retry",
                  onPressed:onPress),
              Button(
                onPressed: (){
                 Wiredash.of(context).show();
                },
                text: "Feedback",
              )
            ],
          )
        ],
      ),
    );
  }
}
