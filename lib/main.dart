import 'package:flutter/material.dart';
import 'package:rw_courses/rw_courses_app.dart';
import 'package:rw_courses/strings.dart';

void main() {
  runApp(MaterialApp(
    title: Strings.appTitle,
    theme: ThemeData(primaryColor: Colors.green.shade800),
    home: const RwCoursesApp(),
  ));
}
