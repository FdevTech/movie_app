import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/common/constants/size_contants.dart';
import 'package:movie_app/presentation/journeys/search_movies/customsearchdelegate.dart';

import '../blocs/searchBloc/search_bloc.dart';
import 'logo.dart';
import 'dart:developer' as dev show log;
class MovieAppBar extends StatelessWidget {
  const MovieAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    dev.log("log search bloc ${BlocProvider.of<SearchBloc>(context)}");
    return Padding(
        padding: EdgeInsets.only(
          top: ScreenUtil().statusBarHeight+ Sizes.dimen_4.h,
          left: Sizes.dimen_16.w,
          right:Sizes.dimen_16.w
        ),

       child: Row(
         children: [
           IconButton(onPressed:(){
             Scaffold.of(context).openDrawer();
           },
           icon: SvgPicture.asset("assets/svgs/menu.svg",
             height: Sizes.dimen_24.h,)),
           const Expanded(
               child: Logo(
                 height: Sizes.dimen_24,
               )),
            IconButton(
              onPressed: (){
                showSearch(context: context,
                    delegate: CustomSearchDelegate(searchBloc: BlocProvider.of<SearchBloc>(context)));
              },
              icon: Icon(Icons.search,
               color: Colors.white,
               size: Sizes.dimen_24.h,),
            )
         ],
       ),
    );
  }
}
