import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test3/layout/news_app/cubit/cubit.dart';
import 'package:test3/layout/news_app/states/states.dart';
import 'package:test3/shared/cubit/cubit.dart';
import 'package:test3/shared/cubit/states.dart';

import '../../shared/network/remote/dio_helper.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext) => NewsCubit()..getBusiness()..getSports()..getScience(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state) => {},
        builder: (context,state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
          appBar: AppBar(
              title: Text(
                'News App',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                IconButton(onPressed: (){}, icon: Icon(Icons.search)),
                IconButton(
                    onPressed: (){

                },
                    icon: Icon(Icons.brightness_4)
                ),
              ],
            ),
          body: cubit.Screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index){
                cubit.changeBottomSheet(index);
              },
              items: cubit.nav,

            ),

          );
        },
      ),
    );
  }
}
