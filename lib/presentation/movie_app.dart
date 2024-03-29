import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/di/get_it.dart';

import 'package:movie_app/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:movie_app/presentation/themes/app_colors.dart';
import 'package:movie_app/presentation/themes/theme_text.dart';
import 'package:movie_app/presentation/wiredash.dart';

import '../common/constants/languages.dart';
import 'journeys/home/home.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MovieApp extends StatefulWidget {
  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
 // late LanguageBloc _languageBloc;

  @override
  void initState() {
    //_languageBloc = getItInstance<LanguageBloc>();
    super.initState();
  }

  @override
  void dispose() {
   // _languageBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(414, 896),
        builder: (context, child) {
          return BlocProvider<LanguageBloc>(
           // value: _languageBloc..add(LoadCurrentLanguage()),
            create: (context)=>(getItInstance<LanguageBloc>())..add(LoadCurrentLanguage()),
            child: BlocBuilder<LanguageBloc, LanguageState>(
              builder: (context, state) {
                if(state is LanguageLoaded)
                  {
                    return WireDashApp(
                      child: MaterialApp(
                        debugShowCheckedModeBanner: false,
                        theme: ThemeData(
                            primaryColor: AppColor.vulcan,
                            accentColor: AppColor.royalBlue,
                            scaffoldBackgroundColor: AppColor.vulcan,
                            visualDensity: VisualDensity.adaptivePlatformDensity,
                            textTheme: ThemeText.getTextTheme(),
                            appBarTheme:  const AppBarTheme(elevation: 0,backgroundColor: AppColor.vulcan)
                        ),
                        supportedLocales: Languages.languages.map((e) =>
                            Locale(e.code))
                            .toList(),
                        locale: state.locale,
                        localizationsDelegates: const [
                          AppLocalizations.delegate,
                          GlobalMaterialLocalizations.delegate,
                          GlobalWidgetsLocalizations.delegate,
                          GlobalCupertinoLocalizations.delegate
                        ],
                        home: child,
                      ),
                    );
                  }
                else {
                  return const SizedBox.shrink();
                }

              },
            ),
          );
        },
        child: const HomeScreen()
    );
  }
}