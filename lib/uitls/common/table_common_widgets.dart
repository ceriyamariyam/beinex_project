// // ignore_for_file: prefer_final_fields

// import 'package:beinex_project/provider/product_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';

// class DatePickerCell extends StatefulWidget {
//   DateTime initialDate; // Add a parameter to receive the initial date
//    bool overdue;

//   DatePickerCell({super.key, required this.initialDate,  this.overdue=true});

//   @override
//   _DatePickerCellState createState() => _DatePickerCellState();
// }

// class _DatePickerCellState extends State<DatePickerCell> {
//   TextEditingController _dateController = TextEditingController();
//   DateTime? _selectedDate;

//   @override
//   void initState() {
//     super.initState();
//     if (widget.initialDate != null) {
//       print("initial date:::${widget.initialDate}");
//       _selectedDate = widget.initialDate;
//             print("Selected date${_selectedDate}");

//       _dateController.text =
//           _formatDate(widget.initialDate); // Format the initial date
//                       print("Selected date${ _formatDate(widget.initialDate)}");

//     }
//   }

//   String _formatDate(DateTime date) {
//     final formattedDate = DateFormat('d MMM yyyy').format(date);
//     final day = DateFormat('d').format(date);
//     final month = DateFormat('MMMM').format(date);
//     final year = DateFormat('yyyy').format(date);
//     return '${_addOrdinalSuffix(day)} $month $year';
//   }

//   String _addOrdinalSuffix(String day) {
//     if (day.endsWith('1') && day != '11') {
//       return '${day}st';
//     } else if (day.endsWith('2') && day != '12') {
//       return '${day}nd';
//     } else if (day.endsWith('3') && day != '13') {
//       return '${day}rd';
//     } else {
//       return '${day}th';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ProductProvider>(builder: (_, value, __) {
//       return Container(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             InkWell(
//               child: Row(
//                 children: [
//                   Icon(
//                     Icons.calendar_today,
//                     color: widget.overdue ? Colors.red : Colors.green,
//                   ),
//                   Text(
//                     _selectedDate != null
//                         ? _formatDate(_selectedDate!)
//                         : 'Select Date',
//                     style: TextStyle(
//                         // color: Colors.blue,
//                         //  decoration: TextDecoration.underline,
//                         ),
//                   ),
//                 ],
//               ),
//               onTap: () {
//                 if (widget.overdue == false) {
//                   _selectDate(context);
//                 }
//               },
//             ),
//           ],
//         ),
//       );
//     });
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: _selectedDate ?? DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );

//     if (picked != null && picked != _selectedDate) {
//       setState(() {
//         _selectedDate = picked;
//         _dateController.text = _formatDate(picked); // Format the selected date
//       });
//     }
//   }
// }


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePickerCell extends StatefulWidget {
  final String initialDate; // Accept initial date as a String
  final bool overdue;

  DatePickerCell({Key? key, required this.initialDate, this.overdue = true})
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
    final formattedDate = DateFormat('d MMM yyyy').format(date);
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
    return Container(
      child: Column(
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
                  style: TextStyle(),
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
      ),
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
