import 'package:flutter/material.dart';
import 'package:rw_courses/model/course.dart';
import 'package:rw_courses/repository/repository_impl.dart';
import 'package:rw_courses/ui/course_details/course_detail_page.dart';
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

        return ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: courses.length,
          itemBuilder: (context, index) {
            return _buildRow(courses[index]);
          },
        );
      },
    );
  }

  Widget _buildRow(Course course) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
          title: Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Text(
              course.name,
              style: const TextStyle(fontSize: 18.0),
            ),
          ),
          subtitle: Text(course.domainStrings),
          trailing: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(course.artworkUrl),
          ),
          onTap: () {
            Navigator.of(context).push<MaterialPageRoute>(
              MaterialPageRoute(
                builder: (context) => CourseDetailsPage(course: course),
              ),
            );
          }),
    );
  }
}
