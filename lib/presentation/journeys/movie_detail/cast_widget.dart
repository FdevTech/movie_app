import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/presentation/blocs/cast_bloc.dart';
import 'dart:developer'as dev show log;

import '../../../common/constants/Api_Constant.dart';
class CastWidget extends StatelessWidget {
  const CastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CastBloc,CastState>(

        builder: (context,state){
          if(state is CastLoaded)
            {
              dev.log("casts lenghth=>${state.casts.length}");
              return Container(
                height: 170,
                child: ListView.builder(
                  shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: state.casts.length,
                    itemBuilder: (context,index){
                      final castEntiry = state.casts[index];
                      return SizedBox(
                        height: 100,
                        width: 130,
                        child:  Card(
                          elevation: 1,
                          margin:  EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 4.h
                          ),
                          shape:  RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.w)
                            ),

                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(child: ClipRRect(
                                borderRadius:  BorderRadius.all(
                                  Radius.circular(8.w)
                                ),
                                child: CachedNetworkImage(
                                  height: 100,
                                  width: 130,
                                  imageUrl:"${ApiConstant.BASE_IMAGE_URL}${castEntiry.posterPath}",
                                  fit: BoxFit.fill,),
                              )),
                              Padding(
                                padding:  EdgeInsets.all(8.0.w).copyWith(top: 0),
                                child: Text(
                                  castEntiry.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                    fontWeight: FontWeight.w500
                                  ),),
                              ),
                              Padding(
                                padding:  EdgeInsets.all(8.0.w).copyWith(top: 0),
                                child: Text(castEntiry.character,
                                  overflow: TextOverflow.ellipsis,maxLines: 1,
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context).textTheme.caption?.copyWith(
                                    color: Theme.of(context).primaryColor
                                  ),),
                              )
                            ],
                          ),
                        ),
                      );
                    }),

              );
            }
            else {
              return const SizedBox.shrink();
          }
        });
  }
}
