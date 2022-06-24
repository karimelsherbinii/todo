import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/buisness_logic/app/app_cubit.dart';
import 'package:todo/utils/colors.dart';

import 'package:eva_icons_flutter/eva_icons_flutter.dart' as eva;

class DeletedTaskWidget extends StatelessWidget {
  Map? model;

  DeletedTaskWidget(
    this.model, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      // Specify a key if the Slidable is dismissible.
      key: ValueKey(model!['id'].toString()),

      // The start action pane is the one at the left or the top side.
      startActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),

        // A pane can dismiss the Slidable.
        dismissible: DismissiblePane(onDismissed: () {
          AppCubit.get(context).deleteFromDatabase(id: model!['id']);
        }),

        // All actions are defined in the children parameter.
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: (context) {
              AppCubit.get(context).deleteFromDatabase(id: model!['id']);
              // AppCubit.get(context).deleteFromDatabase(id: model!['id']);
            },
            backgroundColor: const Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete !!!',
          ),
          // SlidableAction(
          //   onPressed: ((context) {
          //     AppCubit.get(context)
          //                   .updateDatabase(id: model!['id'], status: 'done');
          //   }),
          //   backgroundColor: Color(0xFF21B7CA),
          //   foregroundColor: Colors.white,
          //   icon: Icons.share,
          //   label: 'Archive',
          // ),
        ],
      ),

      // The end action pane is the one at the right or the bottom side.
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          // ClipPath(
          //   clipper: MultiplePointsClipper(Sides.bottom, heightOfPoint: 50),
          //   child: Container(
          //     color: Colors.amber,
          //     height: 10.h,
          //   ),
          // ),
          SlidableAction(
            // borderRadius: BorderRadius.only(
            //   topLeft: Radius.circular(25),
            //   bottomLeft: Radius.circular(25),
            // ),
            onPressed: (context) {
              AppCubit.get(context)
                  .updateDatabase(id: model!['id'], status: 'new');
              // AppCubit.get(context).deleteFromDatabase(id: model!['id']);
            },
            backgroundColor: Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Recover',
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(8.0.sp),
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(1, 4),
                  blurRadius: 5.0,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ],
              borderRadius: BorderRadius.circular(25.sp),
              color: Theme.of(context).colorScheme.background),
          child: Padding(
            padding: EdgeInsets.all(7.0.sp),
            child: Row(
              children: [
                CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    radius: 25.sp,
                    child: Padding(
                      padding: EdgeInsets.all(10.sp),
                      child: FittedBox(
                          child: Text(model!['time'],
                              style: Theme.of(context).textTheme.bodyText1)),
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
                    Text(
                      'Back to Tasks',
                      style: Theme.of(context).textTheme.overline,
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    InkWell(
                      onTap: () {
                        AppCubit.get(context)
                            .updateDatabase(id: model!['id'], status: 'new');
                      },
                      child: Icon(
                        eva.EvaIcons.repeat,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
