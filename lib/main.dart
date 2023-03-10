import 'package:flutter/material.dart';
import 'package:rw_courses/rw_courses_app.dart';
import 'package:rw_courses/state/filter_state_container.dart';
import 'package:rw_courses/strings.dart';

void main() {
  runApp(FilterStateContainer(
    child: MaterialApp(
      title: Strings.appTitle,
      theme: ThemeData(primaryColor: Colors.green.shade800),
      home: const RwCoursesApp(),
    ),
  ));
}
