import 'package:rw_courses/strings.dart';

enum Domain { all, ios, android, flutter, unknown }

extension DomainExtension on Domain {
  String get name {
    switch (this) {
      case Domain.ios:
        return Strings.ios;
      case Domain.all:
        return Strings.all;
      case Domain.android:
        return Strings.android;
      case Domain.flutter:
        return Strings.flutter;
      default:
        return Strings.unknown;
    }
  }
}
