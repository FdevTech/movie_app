import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/common/constants/size_contants.dart';
import 'package:movie_app/presentation/blocs/movie_tabbed/movie_tabed_bloc.dart';
import 'package:movie_app/presentation/journeys/home/movie_tabed/tab_title_widget.dart';

import 'MovieTabbedConstatnts.dart';
import 'movie_list_view_builder.dart';


class MovieTabbedWidget extends StatefulWidget {
  const MovieTabbedWidget({Key? key}) : super(key: key);

  @override
  State<MovieTabbedWidget> createState() => _MovieTabbedWidgetState();
}

class _MovieTabbedWidgetState extends State<MovieTabbedWidget>
    with SingleTickerProviderStateMixin {
  late MovieTabBloc movieTabBloc;
  int currentTabIndex = 0;

  @override
  void initState() {
    movieTabBloc = BlocProvider.of<MovieTabBloc>(context);
    movieTabBloc.add(MovieTabChangedEvent(currentTabIndex: currentTabIndex));
    super.initState();
  }


  @override
  void dispose() {
    movieTabBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabBloc, MovieTabState>(
      builder: (context, state) {
        return Padding(
          padding:  EdgeInsets.only(top: Sizes.dimen_4.h),
          child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for(var i =0; i<MovieTabbedConstants.movieTabs.length;i++)
                      TabTitleWidget(
                          title: MovieTabbedConstants.movieTabs[i].title,
                          isSelected: MovieTabbedConstants.movieTabs[i].index == state.currentTabIndex,
                          onTap: ()=> _onTabTapped(i),

                      )
                  ],
                ),
                if(state is MovieTabChangedState)
                  Expanded(child: MovieListView(movies: state.movies))
              ],
          ),
        );
      },
    );
  }
  void _onTabTapped(int index)
  {
    movieTabBloc.add(MovieTabChangedEvent(currentTabIndex: index));
  }
}
