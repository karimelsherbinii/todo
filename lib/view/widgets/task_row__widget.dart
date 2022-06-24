import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/buisness_logic/app/app_cubit.dart';
import 'package:todo/utils/colors.dart';

import 'package:eva_icons_flutter/eva_icons_flutter.dart' as eva;
import 'package:todo/utils/strings.dart';
import 'package:todo/view/widgets/task_details.dart';

class TaskRoWidget extends StatelessWidget {
  Map? model;

  TaskRoWidget(
    this.model, {
    Key? key,
    required TextEditingController titleController,
    required TextEditingController timeController,
    required TextEditingController dateController,
  }) : super(key: key);
  // var itemKey = GlobalKey<ScaffoldState>();
  var titleController = TextEditingController();

  var timeController = TextEditingController();

  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = FadeInController();
    controller.fadeIn();
    AppCubit cubit = AppCubit.get(context);
    return Slidable(
      // Specify a key if the Slidable is dismissible.
      key: ValueKey(model!['id'].toString()),

      // The start action pane is the one at the left or the top side.
      startActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),

        // A pane can dismiss the Slidable.
        dismissible: DismissiblePane(onDismissed: () {
          AppCubit.get(context)
              .updateDatabase(id: model!['id'], status: 'deleted');
        }),

        // All actions are defined in the children parameter.
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: (context) {
              AppCubit.get(context)
                  .updateDatabase(id: model!['id'], status: 'deleted');
              // AppCubit.get(context).deleteFromDatabase(id: model!['id']);
            },
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Remove',
          ),
        ],
      ),

      // The end action pane is the one at the right or the bottom side.
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          model!['status'] == 'done' || model!['status'] == 'new'
              ? SlidableAction(
                  onPressed: ((context) {
                    AppCubit.get(context)
                        .updateDatabase(id: model!['id'], status: 'archived');
                  }),
                  backgroundColor: const Color(0xFF21B7CA),
                  foregroundColor: Colors.white,
                  icon: Icons.share,
                  label: 'Archive',
                )
              : Container(),
          SlidableAction(
            onPressed: (context) {
              AppCubit.get(context)
                  .updateDatabase(id: model!['id'], status: 'done');
            },
            backgroundColor: const Color(0xFF0392CF),
            foregroundColor: Colors.white,
            icon: Icons.save,
            label: 'Done',
          ),
        ],
      ),
     
        child: FadeIn(
          controller: controller,
          duration: Duration(seconds: 2),
          curve: Curves.easeIn,
          child: Padding(
            padding: EdgeInsets.all(7.0.sp),
            child: Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(1, 4),
                      blurRadius: 5.0,
                      color: Theme.of(context).colorScheme.onBackground,
                    )
                  ],
                  borderRadius: BorderRadius.circular(25.sp),
                  color: Theme.of(context).colorScheme.background),
              child: Padding(
                padding: EdgeInsets.all(8.0.sp),
                child: Row(
                  children: [
                    CircleAvatar(
                        backgroundColor: kSecondary,
                        radius: 25.sp,
                        child: Padding(
                          padding: EdgeInsets.all(10.sp),
                          child: FittedBox(
                              child: Text(
                            model!['time'],
                            style: Theme.of(context).textTheme.bodyText1,
                          )),
                        )
                        // radius: 30,
                        ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            model!['title'],
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          Text(
                            model!['date'],
                            style: Theme.of(context).textTheme.overline,
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            model!['status'] == 'new' ||
                                    model!['status'] == 'archived'
                                ? cubit.updateDatabase(
                                    id: model!['id'], status: 'done')
                                : cubit.updateDatabase(
                                    id: model!['id'], status: 'new');
                          },
                          child: Icon(
                            key: Key(model!['id'].toString()),
                            model!['status'] == 'done'
                                ? eva.EvaIcons.checkmarkCircle2
                                : eva.EvaIcons
                                    .checkmarkCircle2Outline, //checkmarkCircle2Outline, //checkmarkSquare2,
                            color: model!['status'] == 'done'
                                ? Colors.green
                                : Colors.grey[400],
                          ),
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        InkWell(
                          onTap: () {
                            model!['status'] == 'archived'?
                            AppCubit.get(context).updateDatabase(
                                id: model!['id'], status: 'new'):
                            AppCubit.get(context).updateDatabase(
                                id: model!['id'], status: 'archived');
                          },
                          child: Icon(
                            key: ValueKey(model!['status']),
                            model!['status'] == 'archived'
                                ? eva.EvaIcons.arrowCircleLeft
                                : eva.EvaIcons.archive,
                            color: primaryColor,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      
    );
  }
}
