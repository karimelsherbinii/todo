import 'package:flutter/material.dart';
import 'package:todo/buisness_logic/app/app_cubit.dart';
import 'package:todo/utils/strings.dart';
import 'package:todo/view/screens/tasks/deleted_tesks.dart';
import 'package:todo/view/widgets/task_details.dart';

class AppRouter {
  AppCubit? appCubit;

  AppRouter() {
    appCubit = AppCubit();
  }

  Route? generateRoute(RouteSettings settings) {
      Map? model;

    switch (settings.name) {
      case deletedTasks:
        return MaterialPageRoute(
          builder: (_) =>
              // BlocProvider<AppCubit>.value(
              //   value: appCubit!,
              //   child: const
              const Deletedasks(),
          // ),
        );
      // case taskDetails:
      //   return MaterialPageRoute(
      //     builder: (_) =>
      //         // BlocProvider<AppCubit>.value(
      //         //   value: appCubit!,
      //         //   child: const
      //         TaskDetails(model: {},),
      //     // ),
      //   );

      // case otpScreen:
      //   final phoneNumber = settings.arguments;
      //   return MaterialPageRoute(
      //     builder: (_) => BlocProvider<PhoneAuthCubit>.value(
      //       value: phoneAuthCubit!,
      //       child: OtpScreen(phoneNumber: phoneNumber),
      //     ),
      //   );
    }
    return null;
  }
}
