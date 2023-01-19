
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/presentation/drawer/navigation_list_item.dart';

import 'navigation_sublist_item.dart';
import 'dart:developer' as dev show log;
class NavigationExpandedListItem extends StatelessWidget {
  final String title;
  final List<String> children;
  final Function(int) onPressed;
  const  NavigationExpandedListItem({Key? key,
    required this.title,
    required this.children,
    required this.onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Theme.of(context).primaryColor.withOpacity(0.7),
                blurRadius: 2
            )
          ]
      ),
      child: ExpansionTile(
          title:Text(
            title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        children: [
          for(int i=0;i<children.length;i++)
            NavigationSubListItem(
                title: children[i],
                onPressed: (){
                  onPressed(i);})
        ],
      ),
    );
  }
}
