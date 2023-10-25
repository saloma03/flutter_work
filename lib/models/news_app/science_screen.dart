import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../layout/news_app/cubit/cubit.dart';
import '../../layout/news_app/states/states.dart';
import '../../shared/components/components.dart';

class ScienceScreen extends StatelessWidget {
  const ScienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state) {},
        builder: (context,state)
        {
          var list =NewsCubit.get(context).science;
          return ConditionalBuilder(
              condition: list.length>0,
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