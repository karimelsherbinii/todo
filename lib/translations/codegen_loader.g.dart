// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }    static const refresh_completed = 'refresh_completed';
    static const loading = 'loading';

  static const Map<String, dynamic> ar = {
    "hi_text": "مرحباً!",
    "this_should_be_translated": "يجب ترجمة هذا إلى العربية!",
    "tasks_is_empty_please_add_some_tasts":
        "قائمة المهام فارغة !! من فضلك أضف بعض المهام.",
    "home_title": "الرئيسيه",
    "done_tasks_title": "المهام المكتملة",
    "archived_tasks_title": "المهام المؤرشفة",
    "empty": "فارغة",
    "task_title_field": "عنوان المهامة",
    "task_time_field": "وقت المهامة",
    "task_date_field": "تاريخ المهامة",
    "task_title": "العنوان",
    "task_time": "الوقت",
    "task_date": "التاريخ",
    "task_title_error": "العنوان يجب أن لا يكون فارغاً",
    "task_time_error": "الوقت يجب أن لا يكون فارغاً",
    "task_date_error": "التاريخ يجب أن لا يكون فارغاً",
    "remove_task": "حذف",
    "tast_to_archive": "أرشفة",
    "tast_to_delete": "نقل إلي السلة",
    "description": 'التفاصيل',
    "edit_task": "تعديل",
    "trash": "السلة",
    "recover_to_done": "إرجاع",
    "languages": "اللغات",
    "new_tasks_title": "المهام الجديدة",
    "refresh_completed": "تم التنشيط"
  };
  static const Map<String, dynamic> en = {
    "hi_text": "ًWelcome",
    "this_should_be_translated": "This should be translated to Arabic!",
    "tasks_is_empty_please_add_some_tasts":
        "Tasks is empty!! please add some tasks.",
    "home_title": "Home",
    "done_tasks_title": "Done Tasks",
    "archived_tasks_title": "Archived Tasks",
    "empty": "Empty",
    "task_title_field": "Task title",
    "task_time_field": "Task time",
    "task_date_field": "Task data",
    "task_title": "Title",
    "task_time": "Time",
    "task_date": "Date",
    "task_title_error": "Title must be not null!!",
    "task_time_error": "Time must be not null!!",
    "task_date_error": "Date must be not null!!",
    "remove_task": "Remove",
    "tast_to_archive": "Archive",
    "tast_to_delete": "Move to trash",
    "description": "Enter you description",
    "edit_task": "Edit you'r task",
    "trash": " Trash",
    "recover_to_done": "Recover",
    "languages": "Languages",
    "new_tasks_title": "New Tasks",
    "refresh_completed": "Refresh completed"
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "ar": ar,
    "en": en
  };
}
