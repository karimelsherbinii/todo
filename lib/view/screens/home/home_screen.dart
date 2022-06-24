import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo/buisness_logic/app/app_cubit.dart';
import 'package:todo/components/input_fields.dart';
import 'package:todo/components/style_classes.dart';
import 'package:todo/utils/colors.dart';
import 'package:todo/view/screens/tasks/deleted_tesks.dart';

import '../../../utils/constants.dart';
import '../tasks/archives_tasks.dart';
import '../tasks/done_tasks.dart';
import '../tasks/new_tasks.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart' as eva;

//@@@@@@@ Database methods @@@@@@@@@@:
//? 1. create   database
//? 2. create   tables
//? 3. open     database
//? 4. insert   database
//? 5. get from database
//? 6. update   database
//? 7. delete   database
class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  // AppCubit cubit = AppCubit.get(BuildContext );

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  var formKey = GlobalKey<FormState>();

  var titleController = TextEditingController();

  var timeController = TextEditingController();

  var dateController = TextEditingController();
  var descriptionController = TextEditingController();

  var focusNode = FocusNode();
  // late UserModel user;
  // @override
  // void initState() {
  //   super.initState();
  //   AppCubit.get(context).createDatabase();
  // }

  @override
  // build widget
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) => {
        // conditions:
        if (state is InsertDatabaseState) {Navigator.pop(context)},
        // if (state is LoadingDataState)
        //   {

        //   }
        // if (state is AddTaskLoading)
        //   {
        //     LoadingIndicator(
        //       indicatorType: Indicator.ballBeat,
        //       colors: [primaryColor],
        //     )
        //   }
      },
      builder: ((context, state) {
        AppCubit cubit = AppCubit.get(context);

        return Scaffold(
          // backgroundColor: Colors.white,

          key: scaffoldKey,
          appBar: AppBar(
              actions: [
                Padding(
                  padding: EdgeInsets.all(8.0.sp),
                  child: IconButton(
                      onPressed: () {
                        cubit.changeThemeMode();
                      },
                      icon: Icon(eva.EvaIcons.moon)),
                )
              ],
              leading: Builder(
                builder: (context) => IconButton(
                  icon: Icon(eva.EvaIcons.menu2),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                ),
              ),

              // child: Icon(eva.EvaIcons.menu2)),
              backgroundColor: Theme.of(context).colorScheme.background,
              elevation: 0,
              centerTitle: true,
              title: Text(
                cubit.titles[cubit.currentIndex],
                style: Theme.of(context).textTheme.headline6,
              )),
          drawer: Drawer(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    'To DO',
                    style: GoogleFonts.tajawal(fontSize: 30),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 2.w,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        radius: 25.sp,
                        child: Image.asset(
                          'assets/images/person.png',
                          // scale: 1.0.sp,
                          width: 30.sp,

                          // fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(
                        'Welcome',
                        style: GoogleFonts.tajawal(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Deletedasks()));
                    },
                    child: ListTile(
                      title: Text(
                        'Recent Deleted',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      leading: Icon(
                        eva.EvaIcons.trash2,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          body: SafeArea(child: cubit.screens[cubit.currentIndex]),
          // ),
          // ),

          floatingActionButton: FloatingActionButton(
              child: Icon(cubit.isfab),
              onPressed: () {
                // cubit.backwardOnePage();
                if (cubit.isbottomsheetopen) {
                  if (formKey.currentState!.validate()) {
                    cubit
                        .insertToDatabase(
                      title: titleController.text,
                      date: dateController.text,
                      time: timeController.text,
                      description: descriptionController.text,
                    )
                        .then((value) {
                      cubit.changeBottomSheetState(
                          bState: false, fabIcon: Icons.edit);

                      titleController.clear();
                      dateController.clear();
                      timeController.clear();
                      descriptionController.clear();
                    });
                  }
                } else {
                  Navigator.of(context);
                  scaffoldKey.currentState
                      ?.showBottomSheet(
                        // constraints: BoxConstraints(maxHeight: 30.h),
                        // enableDrag:
                        //     Orientation == Orientation.landscape ? true : true,
                        elevation: 15,
                        (context) => SingleChildScrollView(
                          // height: 50.h,
                          // padding: EdgeInsets.all(40.sp),
                          // color: Colors.grey[100],

                          // flex: 1,
                          child: Padding(
                            padding: EdgeInsets.only(top: 5.h, bottom: 10.h),
                            child: Form(
                              key: formKey,
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // Text fields
                                    //1
                                    defaultTextFormField(
                                      controller: titleController,
                                      type: TextInputType.text,
                                      lable: 'Task title',
                                      prefix: Icons.title,
                                      validate: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'Title must be not empty!!';
                                        }
                                        return null;
                                      },
                                    ),
                                    //2
                                    defaultTextFormField(
                                      controller: timeController,
                                      type: TextInputType.text,
                                      lable: 'Task time',
                                      prefix: eva.EvaIcons.clock,
                                      onTap: () {
                                        timeController.text.isEmpty
                                            ? showTimePicker(
                                                    context: context,
                                                    initialTime:
                                                        TimeOfDay.now())
                                                .then((value) {
                                                timeController.text =
                                                    value!.format(context);
                                                print(value.format(context));
                                              })
                                            : null;
                                        print('tapped ');
                                      },
                                      validate: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'Title must be not empty!!';
                                        }
                                        return null;
                                      },
                                    ),
                                    //3
                                    defaultTextFormField(
                                      controller: dateController,
                                      type: TextInputType.datetime,
                                      lable: 'Task date',
                                      prefix: Icons.date_range,
                                      onTap: () {
                                        dateController.text.isEmpty
                                            ? showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime.now(),
                                                lastDate: DateTime.parse(
                                                    '2022-10-05'),
                                              ).then((value) {
                                                dateController.text =
                                                    DateFormat.yMMMd()
                                                        .format(value!);
                                              })
                                            : null;
                                        print('tapped ');
                                      },
                                      validate: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'Title must be not empty!!';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                      .closed
                      .then((value) {
                    cubit.changeBottomSheetState(
                        bState: false, fabIcon: Icons.edit);
                  });
                  cubit.changeBottomSheetState(
                      bState: true, fabIcon: Icons.add);
                  // setState(() {
                  //   isfab = Icons.add;
                  // });
                }
              }),

          // @@@@@@@ bottomNavigationBar @@@@@@@
          bottomNavigationBar: BottomNavigationBar(
            // selectedItemColor: Theme.of(context).colorScheme.onPrimary,
            unselectedItemColor: grayColor,
            selectedFontSize: 10.sp,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.isbottomsheetopen == true ? Navigator.pop(context) : null;
              cubit.changeBottomSheetState(bState: false, fabIcon: Icons.edit);
              titleController.clear();
              dateController.clear();
              timeController.clear();
              // }
              // null;
              cubit.changeNavBarState(index);
              // if (cubit.isbottomsheetopen == true) {
              //   cubit.backwardOnePage();
              // }
            },
            items: [
              const BottomNavigationBarItem(
                icon: Icon(
                  eva.EvaIcons.home,
                  // color: kDarkBG,
                ),
                label: 'Home',
              ),
              const BottomNavigationBarItem(
                  icon: Icon(Icons.done), label: 'Done Tasks'),
              BottomNavigationBarItem(
                  icon: Icon(
                    cubit.currentIndex == 2
                        ? eva.EvaIcons.archive
                        : eva.EvaIcons.archiveOutline,
                  ),
                  label: 'Archived Tasks'),
            ],
          ),
        );
      }),
    );
  }
}
