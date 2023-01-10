import 'package:rw_courses/model/course.dart';
import 'package:rw_courses/repository/repository.dart';
import 'package:rw_courses/repository/repository_impl.dart';

class CoursesController {
  final Repository _repository = RepositoryImpl();

  Future<List<Course>> fetchCourses(int? domainFilter) {
    return _repository.getCourses(domainFilter);
  }
}
