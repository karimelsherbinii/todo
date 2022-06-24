import 'package:eva_icons_flutter/eva_icons_flutter.dart' as eva;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/buisness_logic/app/app_cubit.dart';
import 'package:todo/utils/colors.dart';

import '../../widgets/deleted_tasks_wedget.dart';
import '../../widgets/task_details.dart';

class Deletedasks extends StatefulWidget {
  // final routeName = deletedTasks;
  const Deletedasks({
    Key? key,
  }) : super(key: key);
  // String? title;
  // String? time;
  // String ?date;

  @override
  State<Deletedasks> createState() => _DeletedasksState();
}

class _DeletedasksState extends State<Deletedasks> {
  var titleController = TextEditingController();
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
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        shadowColor: Theme.of(context).colorScheme.background,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
          child: Icon(eva.EvaIcons.arrowIosBack),
        ),
        title:
            Text('Deleted Tasks', style: Theme.of(context).textTheme.headline6),
      ),
      body: BlocConsumer<AppCubit, AppState>(
          listener: ((context, state) {}),
          builder: (context, state) {
            AppCubit cubit = AppCubit.get(context);
            return  SmartRefresher(
              onRefresh: _onRefresh,
              controller: _refreshController,
              enablePullDown: true,
              enablePullUp: true,
              header: const WaterDropHeader(), child:Padding(
              padding: EdgeInsets.all(8.sp),
              child: cubit.deletedTasks.isEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Empty',
                            style: GoogleFonts.tajawal(
                                fontSize: 40.sp, color: Colors.grey[200]),
                          ),
                        )
                      ],
                    )
                  : ListView.separated(
                      physics: BouncingScrollPhysics(),
                      itemCount: cubit.deletedTasks.length,
                      itemBuilder: ((context, index) =>
                          InkWell(
                             onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => TaskDetails(model: cubit.deletedTasks[index])));
                          },
                            child: DeletedTaskWidget(cubit.deletedTasks[index]))),
                      separatorBuilder: (context, index) => Container(
                        height: 0.1.h,
                        width: double.infinity,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
            ));
          }),
    );
  }
}
