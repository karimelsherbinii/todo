import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/helper/cache_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../translations/locale_keys.g.dart';
import '../../view/screens/tasks/archives_tasks.dart';
import '../../view/screens/tasks/done_tasks.dart';
import '../../view/screens/tasks/new_tasks.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);
  bool isCompleted = false;
  int currentIndex = 0;
  var titleController = TextEditingController();

  var timeController = TextEditingController();

  var dateController = TextEditingController();
  var descriptionController = TextEditingController();
//* screens of app
  List<Widget> screens = [
    NewTasks(),
    DoneTasks(),
    ArchivedTasks(),
  ];
//* titles of app
  List<String> titles = [
    LocaleKeys.new_tasks_title.tr(),
    LocaleKeys.done_tasks_title.tr(),
    LocaleKeys.archived_tasks_title.tr(),
  ];
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];
  List<Map> deletedTasks = [];

// Map getTask(){
//   database.
// }

//db object
  late Database database;
  //bottom sheet

  bool isbottomsheetopen = false;
  var isfab = Icons.edit;
// @@@@@@@ nav bar @@@@@@@@@@@
  changeNavBarState(int index) {
    currentIndex = index;
    emit(ChangeNavigationBottomNavBar());
  }

// @@@@@@@ Bottom Sheet @@@@@@@@@@@
  changeBottomSheetState({required bool bState, required IconData fabIcon}) {
    isfab = fabIcon;
    isbottomsheetopen = bState;
    emit(ChangeBottomSheetState());
  }

//? BACKWARD ONE PAGE
  backwardOnePage() {
    emit(BackwordState());
  }
// @@@@@@@ database @@@@@@@@@@@
  //*   Method : 1 @@  Create database @@

  void createDatabase() {
    //create database
    openDatabase('todo.db', version: 1, // numbers of tables
        onCreate: (database, version) {
      //? 1. int    integer
      //? 2. title  string
      //? 3. data   string
      //? 4. time   string
      //? 5. status string
      //! 1  print('database created');
      if (kDebugMode) {
        print('database created');
      }
      database
          .execute(
              'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, description TEXT, status TEXT)')
          .then((value) {
        //! 2   print('create table');
        if (kDebugMode) {
          print('create table');
        }
        //* here i well do things
      }).catchError((error) {
        //! 3  print(error);
        if (kDebugMode) {
          print('Error when create table ${error.toString()}');
        }
      });
    }, onOpen: (database) {
      emit(LoadingDataState());

      getDataFromDatabase(database);
      // .then((value) {
      //   tasks = value;

      //   // print(tasks.last);
      // });
      //! 4 print('database opend');
      if (kDebugMode) {
        print('database opend');
        // print(getDataFromDatabase(db));
      }
    }).then((value) {
      //  emit(LoadingDataState());

      database = value;
      emit(CreateDatabaseState());
    });
  }

  //* Method : 2
  //*  @@  Insert @@
  insertToDatabase({
    required String title,
    required String time,
    required String date,
    String? description,
  }) async {
    //Insert
    return await database.transaction((txn) async {
      await txn
          .rawInsert(
              'INSERT INTO tasks(title, date, time, description, status) VALUES("$title", "$date", "$time", "$description", "new")')
          .then((value) {
        //
        //! p1
        if (kDebugMode) {
          print('data inserted successfully $value');
        }
        emit(InsertDatabaseState());
        getDataFromDatabase(database);
      }).catchError((error) {
        //! p3
        if (kDebugMode) {
          print('Error in add new record ${error.toString()}');
        }
      });
      return null;
    });
  }
  //* @@ get data @@

  void getDataFromDatabase(database) {
    newTasks = [];
    doneTasks = [];
    archivedTasks = [];
    deletedTasks = [];
    emit(LoadingDataState());

    database.rawQuery('SELECT * from tasks').then((value) {
      value.forEach((element) {
        if (element['status'] == 'new') {
          newTasks.add(element);
        } else if (element['status'] == 'done') {
          doneTasks.add(element);
        } else if (element['status'] == 'archived') {
          archivedTasks.add(element);
        } else {
          deletedTasks.add(element);
        }
      });
      emit(LoadingDataState());
      emit(GetDatabaseState());
    });
  }

  //? update fun
  // var status = ['new', 'completed', 'archived'];
  void updateDatabase({required int id, required String status}) {
    database.rawUpdate('UPDATE tasks SET status = ? WHERE id  = ?',
        [status, id]).then((value) {
      getDataFromDatabase(database);
      if (isCompleted == false) {
        isCompleted = true;
      } else if (isCompleted == true) {
        isCompleted = false;
      }

      emit(UpdateDatabaseState());
    });
    //
  }

  //? delete fun
  void deleteFromDatabase({required int id}) {
    database.rawDelete('DELETE FROM tasks WHERE id = ? ', [id]).then((value) {
      getDataFromDatabase(database);
      // deletedTasks.add(value);

      emit(DeleteDatabaseState());
    });
  }

  //@@@@@@@ End Database @@@@@@@@@@:
//title
  void updateTitleDatabase({required int id, required String title}) {
    database.rawUpdate(
        'UPDATE tasks SET title = ? WHERE id  = ?', [title, id]).then((value) {
      emit(UpdateTitleState());

      getDataFromDatabase(database);
    });
    //
  }

//time
  void updateTimeDatabase({required int id, required String time}) {
    database.rawUpdate(
        'UPDATE tasks SET time = ? WHERE id  = ?', [time, id]).then((value) {
      getDataFromDatabase(database);

      emit(UpdateTimeState());
    });

    //
  }

  //date

  void updateDateDatabase({required int id, required String date}) {
    database.rawUpdate(
        'UPDATE tasks SET date = ? WHERE id  = ?', [date, id]).then((value) {
      getDataFromDatabase(database);

      emit(UpdateDateState());
    });
  }
  //

  // description
  void updateDescriptionDatabase(
      {required int id, required String description}) {
    database.rawUpdate('UPDATE tasks SET description = ? WHERE id  = ?',
        [description, id]).then((value) {
      getDataFromDatabase(database);

      emit(UpdateDescriptionState());
    });
    //
  }

  bool isDark = false;

  changeThemeMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(ChangeThemeModeState());
    } else {
      isDark = !isDark;

      CacheHelper.putBoolData(key: 'isDark', value: isDark).then((value) {
        emit(ChangeThemeModeState());
      });
    }
  }
}
