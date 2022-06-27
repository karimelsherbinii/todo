import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/buisness_logic/app/app_cubit.dart';
import 'package:todo/translations/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../widgets/task_details.dart';
import '../../widgets/task_row__widget.dart';

class DoneTasks extends StatefulWidget {
  const DoneTasks({
    Key? key,
    TextEditingController? titleController,
    TextEditingController? timeController,
    TextEditingController? dateController,
  }) : super(key: key);
  // String? title;
  // String? time;
  // String ?date;

  @override
  State<DoneTasks> createState() => _DoneTasksState();
}

class _DoneTasksState extends State<DoneTasks> {
  var focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    final RefreshController _refreshController =
        RefreshController(initialRefresh: false);
    void _onRefresh() async {
      // monitor network fetch
      await Future.delayed(const Duration(milliseconds: 1000));
      // if failed,use refreshFailed()
    AppCubit.get(context).getDataFromDatabase(AppCubit.get(context).database);
      _refreshController.refreshCompleted();
    }

    return BlocConsumer<AppCubit, AppState>(
        listener: ((context, state) {}),
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return SmartRefresher(
              onRefresh: _onRefresh,
              controller: _refreshController,
              enablePullDown: true,
              enablePullUp: true,
              header: const WaterDropHeader(),
              child: Padding(
                padding: EdgeInsets.all(8.sp),
                child: cubit.doneTasks.isEmpty
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              LocaleKeys.empty,
                              style: GoogleFonts.tajawal(
                                  fontSize: 40.sp, color: Colors.grey[200]),
                            ).tr(),
                          )
                        ],
                      )
                    : ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemCount: cubit.doneTasks.length,
                        itemBuilder: ((context, index) => InkWell(
                          onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => TaskDetails(model: cubit.doneTasks[index])));
                          },
                          child: TaskRoWidget(
                                cubit.doneTasks[index],
                                timeController: cubit.timeController,
                                titleController: cubit.titleController,
                                dateController: cubit.dateController,
                              ),
                        )),
                        separatorBuilder: (context, index) => Container(
                          height: 0.1.h,
                          width: double.infinity,
                          color: Colors.grey[300],
                        ),
                      ),
              ));
        });
  }
}
