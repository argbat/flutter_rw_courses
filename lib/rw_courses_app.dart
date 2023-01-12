import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rw_courses/strings.dart';
import 'package:rw_courses/ui/courses/courses_page.dart';
import 'package:rw_courses/ui/filter/filter_page.dart';

class RwCoursesApp extends StatelessWidget {
  const RwCoursesApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.appTitle),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const FilterPage(),
              ),
            ),
          )
        ],
      ),
      body: const CoursesPage(),
    );
  }
}
