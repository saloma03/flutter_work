import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test3/layout/news_app/states/states.dart';
import 'package:test3/models/news_app/business_screen.dart';
import 'package:test3/models/news_app/science_screen.dart';
import 'package:test3/models/news_app/settings_screen.dart';
import 'package:test3/models/news_app/sports_screen.dart';

import '../../../shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>{

  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  List<Widget> Screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];
  int currentIndex =0;

  List<BottomNavigationBarItem>nav = [
    BottomNavigationBarItem(
        icon: Icon(Icons.business),
        label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),


  ];

  void changeBottomSheet(int index){
    currentIndex = index;
    if (index == 1)
      {
        getSports();
      }
    if (index == 2)
    {
      getSports();
    }
    emit(NewsBottomSheetState());
  }

  List<dynamic> business =[];

  void getBusiness(){
    emit(NewsGetBusinessLoadingState());
    if(business.length == 0)
      {
        DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country':'eg',
            'category':'business',
            'apikey':'65f7f556ec76449fa7dc7c0069f040ca'
          },
        ).then((value)
        {
          business = value.data['articles'];
          print(business[0]['title']);

          emit(NewsGetBusinessSuccessState());
        }).catchError((onError)
        {
          print(onError.toString());
          emit(NewsGetBusinessErrorsState(onError));
        });
      }else
        {
          emit(NewsGetBusinessSuccessState());

        }
  }

  List<dynamic> sports =[];

  void getSports(){
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country':'eg',
        'category':'sports',
        'apikey':'65f7f556ec76449fa7dc7c0069f040ca'
      },
    ).then((value)
    {
      sports = value.data['articles'];
      print(sports[0]['title']);

      emit(NewsGetSportsSuccessState());
    }).catchError((onError)
    {
      print(onError.toString());
      emit(NewsGetSportsErrorsState(onError));
    });
  }

  List<dynamic> science =[];

  void getScience(){
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country':'eg',
        'category':'science',
        'apikey':'65f7f556ec76449fa7dc7c0069f040ca'
      },
    ).then((value)
    {
      science = value.data['articles'];
      print(science[0]['title']);

      emit(NewsGetScienceSuccessState());
    }).catchError((onError)
    {
      print(onError.toString());
      emit(NewsGetScienceErrorsState(onError));
    });
  }


}