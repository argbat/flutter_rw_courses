import 'package:flutter/material.dart';
import 'package:rw_courses/repository/repository_impl.dart';
import 'package:rw_courses/ui/courses/courses_controller.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  final _controller = CoursesController(RepositoryImpl());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _controller.fetchCourses(null),
      builder: (context, snapshot) {
        final courses = snapshot.data;

        if (courses == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return Text(courses.toString());
      },
    );
  }
}
