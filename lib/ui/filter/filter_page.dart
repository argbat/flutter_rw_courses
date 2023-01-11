import 'package:flutter/material.dart';
import 'package:rw_courses/strings.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.filter),
      ),
      body: const Text('Filter Page'),
    );
  }
}
