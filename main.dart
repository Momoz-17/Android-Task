import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  String? selectedItem;
  List<String> items = ['Item 1', 'Item 2', 'Item 3'];

  DateTime? selectedDate;
  String? formattedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dropdown and DatePicker')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Dropdown Selector
            const Text('Select an Item:'),
            DropdownButton<String>(
              value: selectedItem,
              items: items.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedItem = value;
                });
              },
            ),
            if (selectedItem != null)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text('Selected: $selectedItem'),
              ),

            const SizedBox(height: 40),

            // Date Picker
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: const Text('Pick a Date'),
            ),
            if (selectedDate != null)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text('Selected Date: $formattedDate'),
              ),
          ],
        ),
      ),
    );
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        formattedDate = '${picked.day}-${picked.month}-${picked.year}';
      });
    }
  }
}
