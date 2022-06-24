import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:todo/buisness_logic/app/app_cubit.dart';
import 'package:todo/helper/cache_helper.dart';
import 'package:todo/utils/app_route.dart';
import 'package:todo/utils/colors.dart';
import 'package:todo/utils/strings.dart';

import 'buisness_logic/bloc_observer.dart';
import 'view/screens/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getDataFromSharedPreference(key: 'isDark');
  BlocOverrides.runZoned(
    () async {
      runApp(MyApp(
        appRouter: AppRouter(),
        isDark: isDark,
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  bool? isDark;
  MyApp({
    Key? key,
    required this.appRouter,
    required this.isDark,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: ((context) => AppCubit()
              ..createDatabase()
              ..changeThemeMode(fromShared: isDark))),
      ],
      child: BlocConsumer<AppCubit, AppState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Sizer(
              builder: ((context, orientation, deviceType) {
                return LayoutBuilder(builder: (context, constraints) {
                  return MaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'Todo App',
                    //!dark
                    darkTheme: ThemeData(
                      
                      timePickerTheme:
                          TimePickerThemeData(backgroundColor: kDarkBG),
                      //bottom sheet
                      bottomSheetTheme: const BottomSheetThemeData(
                        backgroundColor: kDarkBG,
                      ),
                      // iconTheme: IconThemeData(color: Colors.white),
                      textTheme: TextTheme(
                        headline6: GoogleFonts.tajawal(
                          color: Colors.white,
                          fontSize: 20.sp,
                        ),
                        overline: GoogleFonts.tajawal(
                          color: Colors.white,
                          fontSize: 10.sp,
                        ),
                        bodyText2: GoogleFonts.tajawal(
                          color: Colors.white,
                          fontSize: 15.sp,
                        ),
                      ),
                      appBarTheme: const AppBarTheme(
                        iconTheme: IconThemeData(
                          color: Colors.white,
                        ),
                        backgroundColor: kDarkBG,
                        // backwardsCompatibility: false, // for control status bar
                        systemOverlayStyle: SystemUiOverlayStyle(
                            // statusBarColor: Colors.white,
                            statusBarIconBrightness: Brightness.light),
                      ),
                      bottomNavigationBarTheme:
                          const BottomNavigationBarThemeData(
                              type: BottomNavigationBarType.fixed,
                              backgroundColor: kDarkBG,
                              // elevation: 5,
                              selectedItemColor: kSecondary),
                      colorScheme: kColorDarkScheme,
                    ),
                    //!light
                    theme: ThemeData(
                      timePickerTheme: TimePickerThemeData(
                        hourMinuteTextColor: kSecondary,
                        dialHandColor: kSecondary,
                        entryModeIconColor: kSecondary,
                        backgroundColor: kLightBG,
                        // helpTextStyle:
                      ),
                      //date picker,

                      //bottom sheet
                      bottomSheetTheme: const BottomSheetThemeData(
                        backgroundColor: kLightBG,
                      ),
                      iconTheme: const IconThemeData(color: Colors.black),
                      textTheme: TextTheme(
                        overline: GoogleFonts.tajawal(
                          color: Colors.black,
                          fontSize: 10.sp,
                        ),
                        bodyText2: GoogleFonts.tajawal(
                          color: Colors.black,
                          fontSize: 15.sp,
                        ),
                        bodyText1: GoogleFonts.tajawal(
                          color: Colors.white,
                          fontSize: 15.sp,
                        ),
                      ),
                      appBarTheme: const AppBarTheme(
                        // ignore: deprecated_member_use
                        backwardsCompatibility: false,
                        backgroundColor: kLightBG, // for control status bar
                        systemOverlayStyle: SystemUiOverlayStyle(
                            // statusBarColor: Colors.black,
                            statusBarIconBrightness: Brightness.dark),
                      ),
                      //bottom nav
                      bottomNavigationBarTheme:
                          const BottomNavigationBarThemeData(
                              type: BottomNavigationBarType.fixed,
                              elevation: 20,
                              backgroundColor: kLightBG,
                              selectedItemColor: kSecondary),
                      colorScheme: kColorScheme,
                    ),

                    //thememode
                    themeMode: AppCubit.get(context).isDark
                        ? ThemeMode.light
                        : ThemeMode.dark,
                    home: HomeScreen(),
                    onGenerateRoute: appRouter.generateRoute,
                    initialRoute: homeScreen,
                  );
                });
              }),
            );
          }),
    );
  }
}
