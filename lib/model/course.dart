import 'package:rw_courses/constans.dart';
import 'package:rw_courses/model/domain.dart';

class Course {
  final String courseId;
  final String name;
  final String description;
  final String artworkUrl;
  final String difficulty;
  final String contributors;
  final List<Domain> domains;

  Course(this.courseId, this.name, this.description, this.artworkUrl,
      this.difficulty, this.contributors, this.domains);

  Course.fromJson(Map<String, dynamic> json)
      : courseId = json['id'] as String,
        name = json['attributes']['name'] as String,
        description = json['attributes']['description_plain_text'] as String,
        artworkUrl = json['attributes']['card_artwork_url'] as String,
        difficulty = json['attributes']['difficulty'] as String,
        contributors = json['attributes']['contributor_string'] as String,
        domains = [] {
    final domainsData =
        json['relationships']['domains']['data'] as List<dynamic>;
    if (domainsData.isNotEmpty) {
      for (var i = 0; i < domainsData.length; i++) {
        final domain = Course.getDomain(
            json['relationships']['domains']['data'][i]['id'] as String);
        domains.add(domain);
      }
    }
  }

  @override
  String toString() {
    return '$name:$domainStrings';
  }

  static getDomain(String domainId) {
    switch (domainId) {
      case Constants.iosDomian:
        return Domain.ios;
      case Constants.androidDomian:
        return Domain.android;
      case Constants.flutterDomian:
        return Domain.flutter;
      default:
        return Domain.unknown;
    }
  }

  String get domainStrings {
    if (domains.isEmpty) {
      return '';
    }
    if (domains.length == 1) {
      return domains.last.name;
    }
    return domains
            .getRange(0, domains.length - 1)
            .map((e) => e.name)
            .reduce((value, element) => '$value, $element') +
        domains.last.name;
  }
}
