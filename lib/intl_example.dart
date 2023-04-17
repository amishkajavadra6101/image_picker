import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class IntleExample extends StatelessWidget {
  const IntleExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize the intl package with the en_US locale
    initializeDateFormatting('en_US');
    // Get the current date and time
    DateTime now = DateTime.now();
    // Format the date and time using the intl package
    // String prac = DateFormat('dd/MM/yyyy').format(now);
    String formattedDate1 = DateFormat.yMd().format(now);
    String formattedDate2 = DateFormat.yMMMMEEEEd().format(now);
    String formattedDate3 = DateFormat('EEEEE', 'en_US').format(now);
    String formattedDate4 = DateFormat('EEEEE', 'ln').format(now);
    DateTime data = DateFormat.yMd('en_US').parse('1/10/2012');
    DateTime time = DateFormat('Hms', 'en_US').parse('14:23:01');
    String last = DateFormat.yMEd().add_jms().format(DateTime.now());
    String formattedTime = DateFormat.jm().format(now);
    String formattedNumber =
        NumberFormat.currency(locale: 'en_US', symbol: '\$').format(1234.56);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Date, Time, and Number Formatting usign intl'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Formatted Date1: $formattedDate1',
              style: const TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 16),
            Text(
              'Formatted Date2: $formattedDate2',
              style: const TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 16),
            Text(
              'Formatted Date3: $formattedDate3',
              style: const TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 16),
            Text(
              'Formatted Date4: $formattedDate4',
              style: const TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 16),
            Text(
              'date: $data',
              style: const TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 16),
            Text(
              'time: $time',
              style: const TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 16),
            Text(
              'full date and time: $last',
              style: const TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 16),
            Text(
              'Formatted Time: $formattedTime',
              style: const TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 16),
            Text(
              'Formatted Number: $formattedNumber',
              style: const TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
