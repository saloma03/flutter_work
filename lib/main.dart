import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test3/layout/news_app/news_layout.dart';
import 'package:test3/modules/BMICalulator.dart';
import 'package:test3/modules/count/CountScreen.dart';
import 'package:test3/modules/home_screen.dart';
import 'package:test3/modules/login_screen.dart';
import 'package:test3/modules/messenger_screen.dart';
import 'package:test3/shared/bloc_observer/bloc.dart';
import 'package:test3/shared/network/remote/dio_helper.dart';

import 'modules/UsersScreen.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    // scaffold to order the screen
    return MaterialApp( // run whole app
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Colors.deepOrange,
          ),
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.deepOrange,
          ),
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            titleTextStyle: TextStyle(
              color: Colors.black,
            ),
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarBrightness: Brightness.dark,

            ),
            backgroundColor: Colors.white,
            elevation: 0.0,

          )
        ),
        themeMode: ThemeMode.light,
        darkTheme: ThemeData(
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.deepOrange,
            ),
            appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              titleTextStyle: TextStyle(
                color: Colors.white,
              ),
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.black,
                statusBarBrightness: Brightness.dark,

              ),
              backgroundColor: Colors.black,
              elevation: 0.0,

            )
        ),
        home: Directionality(
          textDirection: TextDirection.ltr,
            child: BMICalculator()
        ),


    );
  }
}