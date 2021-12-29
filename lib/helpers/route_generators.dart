import 'package:flutter/material.dart';
import 'package:my_to_do/Objects/task.dart';
import 'package:my_to_do/Objects/taskList.dart';
import 'package:my_to_do/pages/every_taskList.dart';
import 'package:my_to_do/main.dart';
import 'package:my_to_do/pages/login.dart';
import 'package:my_to_do/pages/tasks_in_list.dart';
import 'package:my_to_do/pages/write_task.dart';
import 'package:my_to_do/pages/write_list.dart';
import 'package:page_transition/page_transition.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {

      // Main screen
      case '/':
        return MaterialPageRoute(builder: (_) => main_screen());

      case '/Log_In_page':
        return PageTransition(child: Log_In_Page(), type: PageTransitionType.leftToRight);

      case '/list_lists':
        return PageTransition(
            child: every_taskList(), type: PageTransitionType.rightToLeft);

      case '/write_task':
        return MaterialPageRoute(
            builder: (_) => Write_Task(task: args as String));

      case '/write_list':
        return MaterialPageRoute(
            builder: (_) => write_List(NameList: args as String));

      case '/tasks_in_list':
        // return MaterialPageRoute(
        //     builder: (_) => tasksInOneList(args as TaskList));
        return PageTransition(
            child: tasksInOneList(args as TaskList),
            type: PageTransitionType.bottomToTop);
      default:
        return MaterialPageRoute(builder: (_) => main_screen());
    }
  }
}
