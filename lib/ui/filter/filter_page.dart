import 'package:flutter/material.dart';
import 'package:rw_courses/constans.dart';
import 'package:rw_courses/state/filter_state_container.dart';
import 'package:rw_courses/strings.dart';
import 'package:rw_courses/ui/filter/filter.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  late FilterState state;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // The inherited widget that holds the state was updated.
    state = FilterStateContainer.of(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.filter),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          FilterWidget(
            text: Strings.ios,
            value: Constants.iosfiler,
            groupValue: state.filterValue,
            onChanged: _handleRadioValueChange,
          ),
          FilterWidget(
            text: Strings.android,
            value: Constants.androidfiler,
            groupValue: state.filterValue,
            onChanged: _handleRadioValueChange,
          ),
          FilterWidget(
            text: Strings.flutter,
            value: Constants.flutterfiler,
            groupValue: state.filterValue,
            onChanged: _handleRadioValueChange,
          ),
          FilterWidget(
            text: Strings.all,
            value: Constants.allFilters,
            groupValue: state.filterValue,
            onChanged: _handleRadioValueChange,
          ),
        ],
      ),
    );
  }

  void _handleRadioValueChange(int? value) async {
    state.updateFilterValue(value ?? 0);
  }
}
