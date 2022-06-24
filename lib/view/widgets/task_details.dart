import 'package:eva_icons_flutter/eva_icons_flutter.dart' as eva;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/components/input_fields.dart';

import '../../buisness_logic/app/app_cubit.dart';

class TaskDetails extends StatelessWidget {
  Map model;

  TaskDetails({
    Key? key,
    required this.model,
    // required TextEditingController titleController,
    // required TextEditingController timeController,
    // required TextEditingController dateController,
  }) : super(key: key);

  var scaffoldKey = GlobalKey<ScaffoldState>();

  var formKey = GlobalKey<FormState>();

  var titleController = TextEditingController();

  var timeController = TextEditingController();

  var dateController = TextEditingController();
  var descriptionController = TextEditingController();

  var focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    // Map cubit.newTasks[]

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        shadowColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(eva.EvaIcons.arrowIosBack),
        ),
        title: Text(
          'Edit you\'r task',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: ValueKey(model['id'].toString()),
          child: Column(
            children: [
              defaultTextFormField(
                controller: cubit.titleController,
                type: TextInputType.text,
                lable: model['title'], // model['title'],
                prefix: Icons.title,
                onSubmit: (value) {
                  cubit.updateTitleDatabase(
                      id: model['id'], title: cubit.titleController.text);
                },
                validate: (String? value) {
                  if (value!.isEmpty) {
                    return 'Title must be not empty!!';
                  }
                  return null;
                },
              ),
              defaultTextFormField(
                controller: cubit.timeController,
                type: TextInputType.text,
                lable: model['time'], //  model['time'],
                prefix: eva.EvaIcons.clock,
                onSubmit: (value) {
                  cubit.updateTimeDatabase(
                      id: model['id'], time: cubit.timeController.text);
                },
                onTap: () {
                  cubit.timeController.text.isEmpty
                      ? showTimePicker(
                              context: context, initialTime: TimeOfDay.now())
                          .then((value) {
                          cubit.timeController.text = value!.format(context);
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
              defaultTextFormField(
                controller: cubit.dateController,
                type: TextInputType.datetime,
                lable: model['date'], //formKey.currentState.toString(),
                prefix: Icons.date_range,
                onSubmit: (value) {
                  cubit.updateDateDatabase(
                      id: model['id'], date: cubit.titleController.text);
                },
                onTap: () {
                  cubit.dateController.text.isEmpty
                      ? showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.parse('2022-10-05'),
                        ).then((value) {
                          cubit.dateController.text =
                              DateFormat.yMMMd().format(value!);
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
              CustomTextField1(
                mycontroller: cubit.descriptionController,
                text: 'Enter you\'r task description ...',
                onSubmit: (value) {
                  cubit.updateDescriptionDatabase(
                      id: model['id'],
                      description: cubit.descriptionController.text);
                },
                fieldWidth: 99.w,
                fieldHeigh: 30.h,
                myFocusNode: focusNode,
              )
              // buildInputTF(
              //     initialValue: null,
              //     isEditFunc: null,
              //     isEdit: null,
              //     hint: null,
              //     errorColor: null,
              //     validator: null,
              //     messageError: null,
              //     onSave: null,
              //     onChange: null,
              //     myFocusNode: focusNode,
              //     icon: eva.EvaIcons.list,
              //     title: 'Description',
              //     onTap: () {},
              //     mycontroller: descriptionController)
            ],
          ),
        ),
      ),
    );
  }
}
