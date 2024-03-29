
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:movie_app/presentation/drawer/navigation_list_item.dart';
import 'package:movie_app/presentation/journeys/favorite/favorite_screen.dart';
import 'package:movie_app/presentation/widgets/logo.dart';
import 'package:wiredash/wiredash.dart';

import '../../common/constants/languages.dart';
import '../../common/constants/size_contants.dart';
import '../widgets/app_dialog.dart';
import 'navigation_expanded_list_tile.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      width: Sizes.dimen_300.w,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            blurRadius: 4
          )
        ],
      ),
      child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Padding(
                   padding: EdgeInsets.only(
                     top: Sizes.dimen_24.h,
                     bottom: Sizes.dimen_18.h,
                     left: Sizes.dimen_100.w,
                     right: Sizes.dimen_8.w
                   ),
                 child: const Logo(
                     height: Sizes.dimen_40),

               ),
               NavigationListItem(
                   //title: TranslationConstants.favoriteMovies.t(context),
                   title: AppLocalizations.of(context)!.favoriteMovies,
                   onPressed: (){
                     Navigator.of(context).pop();
                     Navigator.of(context).push(MaterialPageRoute(builder: (context){
                       return const FavoriteScreen();
                     }));
                   }),
              NavigationExpandedListItem(
                //title: TranslationConstants.languages.t(context),
                  title: AppLocalizations.of(context)!.languages,
                onPressed: (i){
                  BlocProvider.of<LanguageBloc>(context).add(ToggleLanguageEvent(Languages.languages[i]));
                },
                children: Languages.languages.map((e) => e.value).toList(),
              ),
              NavigationListItem(
                  //title: TranslationConstants.feedback.t(context),
                   title: AppLocalizations.of(context)!.feedback,
                  onPressed: (){
                    Navigator.of(context).pop();
                    Wiredash.of(context).show();
                  }),
              NavigationListItem(
                  //title: TranslationConstants.about.t(context),
                  title: AppLocalizations.of(context)!.about,
                  onPressed: (){
                    Navigator.of(context).pop();
                    _showDialog(context);
                  })
            ],
          )),

    );
  }
  void _showDialog(BuildContext context)
  {
    showDialog(
        context: context, 
        builder:(context){
          return AppDialog(
            //title: "About",
            title: AppLocalizations.of(context)!.about,
            description: "This product uses the TMDB API but is not, endorsed or certified by TMDb."
                "This app is developed for education purpose.",
            child: Image.asset("assets/pngs/tmdb_logo.png"),
          );
        }
    );
  }
}
