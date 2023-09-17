

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerCell extends StatefulWidget {
  final String initialDate; 
  final bool overdue;

  const DatePickerCell({Key? key, required this.initialDate, this.overdue = true})
      : super(key: key);

  @override
  _DatePickerCellState createState() => _DatePickerCellState();
}

class _DatePickerCellState extends State<DatePickerCell> {
  TextEditingController _dateController = TextEditingController();
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    if (widget.initialDate.isNotEmpty) {
      _selectedDate = DateTime.parse(widget.initialDate);
      _dateController.text = _formatDate(_selectedDate!);
    }
  }

  String _formatDate(DateTime date) {
     DateFormat('d MMM yyyy').format(date);
    final day = DateFormat('d').format(date);
    final month = DateFormat('MMMM').format(date);
    final year = DateFormat('yyyy').format(date);
    return '${_addOrdinalSuffix(day)} $month $year';
  }

  String _addOrdinalSuffix(String day) {
    if (day.endsWith('1') && day != '11') {
      return '${day}st';
    } else if (day.endsWith('2') && day != '12') {
      return '${day}nd';
    } else if (day.endsWith('3') && day != '13') {
      return '${day}rd';
    } else {
      return '${day}th';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          child: Row(
            children: [
              Icon(
                Icons.calendar_today,
                color: widget.overdue ? Colors.red : Colors.green,
              ),
              Text(
                _selectedDate != null
                    ? _formatDate(_selectedDate!)
                    : 'Select Date',
              ),
            ],
          ),
          onTap: () {
            if (widget.overdue == false) {
              _selectDate(context);
            }
          },
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = _formatDate(picked);
      });
    }
  }
}
