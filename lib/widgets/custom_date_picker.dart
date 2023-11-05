import 'package:flutter/material.dart';
import 'package:flutter_sizer/flutter_sizer.dart';

class CustomDatePicker extends StatefulWidget {
  final DateTime initialDate;
  final DateTime firstDate;
  final DateTime lastDate;

  const CustomDatePicker({
    Key? key,
    required this.initialDate,
    required this.firstDate,
    required this.lastDate,
  }) : super(key: key);

  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime _selectedDate = DateTime.now();

  void _selectYear(int year) {
    setState(() {
      _selectedDate = DateTime(year, _selectedDate.month, _selectedDate.day);
    });
  }

  void _selectMonth(int month) {
    setState(() {
      _selectedDate = DateTime(_selectedDate.year, month, _selectedDate.day);
    });
  }

  void _selectDay(int day) {
    setState(() {
      _selectedDate = DateTime(_selectedDate.year, _selectedDate.month, day);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: Text('No Date')),
            SizedBox(width: 10.dp),
            ElevatedButton(onPressed: () {}, child: Text('Today'))
          ],
        )
      ],
    );
  }
}
