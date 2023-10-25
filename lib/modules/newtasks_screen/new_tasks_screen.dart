import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test3/shared/components/components.dart';
import 'package:test3/shared/cubit/cubit.dart';
import 'package:test3/shared/cubit/states.dart';

import '../../shared/components/constants.dart';

class NewTaskScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      return BlocConsumer<AppCubit,AppStates>(
        listener: (context,state){},
        builder: (context,state) {
          var tasks = AppCubit.get(context).newTasks;

          return tasksBuilder(tasks);
        }
      );
    }
  }

