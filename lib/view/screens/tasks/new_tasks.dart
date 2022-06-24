import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart' as sizer;
import 'package:todo/buisness_logic/app/app_cubit.dart';

import '../../../utils/colors.dart';
import '../../widgets/task_details.dart';
import '../../widgets/task_row__widget.dart';
import 'dart:io';

class NewTasks extends StatefulWidget {
  NewTasks({
    Key? key,
    TextEditingController? titleController,
    TextEditingController? timeController,
    TextEditingController? dateController,
  }) : super(key: key);
  // String? title;
  // String? time;
  // String ?date;

  @override
  State<NewTasks> createState() => _NewTasksState();
}

class _NewTasksState extends State<NewTasks> {
  // AppCubit cubit = AppCubit.get(context);

  var focusNode = FocusNode();
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    AppCubit.get(context).getDataFromDatabase(AppCubit.get(context).database);
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQueryData();

    var orientation = sizer.SizerUtil.orientation == Orientation.landscape;

    AppCubit cubit = AppCubit.get(context);
    return BlocConsumer<AppCubit, AppState>(listener: ((context, state) {
      if (state is LoadingDataState) {
        const Center(
          child: CircularProgressIndicator(),
        );
      }
    }), builder: (context, state) {
      AppCubit cubit = AppCubit.get(context);
      if (cubit.newTasks.isEmpty) {
        return SingleChildScrollView(
          child: Column(
            children: [
              orientation
                  ? SizedBox(
                      height: 30.sp,
                    )
                  : SizedBox(
                      height: 60.sp,
                    ),
              orientation
                  ? Center(
                      child: Image.asset(
                        'assets/images/tasksEmpty.png',
                        // scale: 1.0,
                        width: 150.sp,
                      ),
                    )
                  : Center(
                      child: Image.asset(
                        'assets/images/tasksEmpty.png',
                        // scale: 1.0,
                        // width: 200,
                      ),
                    ),
              SizedBox(
                height: 3.h,
              ),
              Center(
                child: Text(
                  'Tasks is empty!! please add some tasks.',
                  style: GoogleFonts.tajawal(fontSize: 15.sp),
                ),
              )
            ],
          ),
        );
      }
      return SmartRefresher(
        onRefresh: _onRefresh,
        controller: _refreshController,
        enablePullDown: true,
        enablePullUp: true,
        header: const WaterDropHeader(),
        child: Padding(
          padding: EdgeInsets.all(8.sp),
          child: ListView.separated(
            physics: BouncingScrollPhysics(),
            itemCount: cubit.newTasks.length,
            itemBuilder: ((context, index) => InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            TaskDetails(model: cubit.newTasks[index])));
                  },
                  child: TaskRoWidget(
                    cubit.newTasks[index],
                    timeController: cubit.timeController,
                    titleController: cubit.titleController,
                    dateController: cubit.dateController,
                  ),
                )),
            separatorBuilder: (context, index) => Container(
              height: 0.1.h,
              width: double.infinity,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ),
        ),
      );
    });
  }
}
