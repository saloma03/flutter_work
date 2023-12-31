import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test3/layout/news_app/cubit/cubit.dart';
import 'package:test3/layout/news_app/states/states.dart';
import 'package:test3/shared/components/components.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state) {},
      builder: (context,state)
      {
        var list =NewsCubit.get(context).business;
        return ConditionalBuilder(
          condition: state is! NewsGetBusinessLoadingState,
          builder: (context) => ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context,index) => buildArticleItem(list[index]),
              separatorBuilder: (context,index) => myDivider(),
              itemCount: 10
          ),
          fallback: (context) => Center(
              child: CircularProgressIndicator()
          )
        );
      }
    );
  }
}
