// import 'dart:ffi';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test3/modules/archived_tasks_screen/archived_task.dart';
import 'package:test3/modules/donetasks_screen/done_task_screen.dart';
import 'package:test3/modules/newtasks_screen/new_tasks_screen.dart';
import 'package:test3/shared/components/components.dart';
import 'package:test3/shared/cubit/cubit.dart';
import 'package:test3/shared/cubit/states.dart';

import '../../shared/components/constants.dart';

class HomeLayout extends StatelessWidget {


  var bottomSheetKey = GlobalKey<ScaffoldState>();
  var validate = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();


  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   createDataBase();
  // }
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext) => AppCubit()..createDataBase() ,

      child: BlocConsumer<AppCubit,AppStates>(
        listener:(context,state) {
          if(state is AppInsertDatabaseState)
            {
              Navigator.pop(context);
            }
        },
        builder: (context,state) {
          AppCubit cubit = AppCubit.get(context);
          return  Scaffold
            (
            key: bottomSheetKey,
            appBar: AppBar
              (
              title: Text
                (
                'Tasks',
              ),
            ),
            floatingActionButton: FloatingActionButton
              (
              onPressed: ()
              {
                // if(titleKey.currentState!.validate()){
                if(cubit.isSheetOpened){
                  if(validate.currentState!.validate()){
                    cubit.insertToDataBase(
                        title: titleController.text,
                        date: dateController.text,
                        time: timeController.text,
                    );
                  }
                }else{
                  bottomSheetKey.currentState!.showBottomSheet(
                    elevation: 10.0,
                        (context) => Container(
                      color: Colors.grey[200],
                      padding: const EdgeInsets.all(20.0),
                      child: Form (
                        key: validate,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children:
                          [
                            defaultFormField(
                              controller: titleController,
                              type: TextInputType.text,
                              validate: (value){
                                if(value != null && value .isEmpty)
                                {
                                  return 'Title must not be empty';
                                }
                              },
                              label: 'Task Title',
                              prefix: Icon(Icons.title),
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            defaultFormField(
                                controller: timeController,
                                type: TextInputType.datetime,
                                validate: (value){
                                  if(value != null && value .isEmpty)
                                  {
                                    return 'time must not be empty';
                                  }
                                },
                                label: 'Task Time',
                                prefix: Icon(Icons.watch_later_outlined),
                                onTap: (){
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((value) {
                                    timeController.text = value!.format(context).toString();
                                  });
                                }
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            defaultFormField(
                                controller: dateController,
                                type: TextInputType.datetime,
                                validate: (value){
                                  if(value != null && value .isEmpty)
                                  {
                                    return 'time must not be empty';
                                  }
                                },
                                label: 'Task Time',
                                prefix: Icon(Icons.calendar_month_outlined),
                                onTap: (){
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.parse('2030-05-03'),
                                  ).then((value) {
                                    dateController.text = DateFormat.yMMMd().format(value!);
                                  });
                                }),

                          ],
                        ),
                      ),
                    ),
                  ).closed.then((value){
                    cubit.changeSheetState(
                        sheetState: false,
                        Icon: Icons.edit);
                  });
                  cubit.changeSheetState(
                      sheetState: true,
                      Icon: Icons.add);

                }

              },
              child: Icon
                (
                cubit.fabIcon,
              ),
            ),
            body: ConditionalBuilder(
              builder: (context) => cubit.Screens[cubit.currentIndex],
              condition: state is! AppGetDatabaseLoadingState,
              fallback: (context) => Center(child: CircularProgressIndicator()),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index){
                // setState(() {
                // });
                cubit.changeIndex(index);
              },
              items:
              [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu,
                  ),
                  label: 'Tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.check_circle_outline,
                  ),
                  label: 'Done',

                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.archive_outlined,
                  ),
                  label: 'Archive',

                )
              ],
            ),

          );
        },
      ),
    );

  }




}
