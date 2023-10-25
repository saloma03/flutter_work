import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test3/modules/archived_tasks_screen/archived_task.dart';
import 'package:test3/modules/donetasks_screen/done_task_screen.dart';
import 'package:test3/modules/newtasks_screen/new_tasks_screen.dart';
import 'package:test3/shared/cubit/states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialStates());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> Screens = [
    NewTaskScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),


  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBar());
  }

  bool isSheetOpened = false;
  IconData fabIcon = Icons.edit;

  void changeSheetState({
    required bool sheetState,
    required IconData Icon,
})
  {
    isSheetOpened = sheetState;
    fabIcon = Icon;
    emit(AppChangeSheetState());
  }
  late Database database;

  List<Map> newTasks = [];

  List<Map> doneTasks = [];

  List<Map> archivedTasks = [];


  void createDataBase()
  {
     openDatabase(
      'todo.db',
      version: 1,
      onCreate: (database, version) async
      {
        print('database created');
        database.execute('CREATE TABLE tasks (id INTEGER PRIMARY KEY,title TEXT ,date TEXT, time TEXT,status TEXT)').then((value)
        {
          print('table created');
        }).catchError((onError){
          print("Error when creating table ${onError.toString()}");
        });
      },
      onOpen: (database)
      {
        getDataFromDatabase(database);
        print('database opened');
      },
    ).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
     });}

    insertToDataBase
      ({
    required String title,
    required String date,
    required String time,

  }) async
  {
     await database.transaction((txn) async
    {
      txn.rawInsert('INSERT INTO tasks(title, date, time, status) VALUES("$title", "$date", "$time", "new") '
      ).then((value)
      {
        print('$value inserted successfully');
        emit(AppInsertDatabaseState());
        getDataFromDatabase(database);
      }).catchError((onError){
        print("Error when Inserting row ${onError.toString()}");
      });
    });
  }
  
  

  void updateData ({
    required String status,
    required int id,
}){
    database.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', id]).then((value) {

          getDataFromDatabase(database);
          emit(AppUpdateStatus());
    });
  }
  
  void deleteData ({
    required int id,
}){
    database.rawDelete('DELETE FROM tasks WHERE id = ?', ['id']).then((value) {
      getDataFromDatabase(database);
      emit(AppDeleteStatus());
    });
  }
   
  void getDataFromDatabase(database)
  {
    emit(AppGetDatabaseLoadingState());
     database.rawQuery('SELECT * FROM tasks').then((value){
       newTasks = [];
       doneTasks = [];
       archivedTasks = [];

       value.forEach((element) {
         if(element['status'] == 'new')
           {
             newTasks.add(element);
           }
         else if(element['status'] == 'Done')
           {
             doneTasks.add(element);
           }
         else {
           archivedTasks.add(element);
         }
       });
       emit(AppGetDatabaseState());
     });
    // return await database.rawDelete("Delete from tasks where(tasks.title = 'dsdd')");
  }
}