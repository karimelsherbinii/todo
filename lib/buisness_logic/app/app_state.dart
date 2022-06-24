part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class ChangeNavigationBottomNavBar extends AppState {}

//! DATABASE
class CreateDatabaseState extends AppState {}

class InsertDatabaseState extends AppState {}

class GetDatabaseState extends AppState {}

class UpdateDatabaseState extends AppState {}

class DeleteDatabaseState extends AppState {}

class LoadingDataState extends AppState {}

//! BOTTOM SHEET
class ChangeBottomSheetState extends AppState {}

//! BACKWARD ONE PAGE
class BackwordState extends AppState {}

class AddTaskLoading extends AppState {}

//
class UpdateTitleState extends AppState {}

class UpdateTimeState extends AppState {}
class UpdateDateState extends AppState {}
class UpdateDescriptionState extends AppState {}

//theme
class ChangeThemeModeState extends AppState {}
