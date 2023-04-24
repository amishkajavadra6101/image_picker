import 'package:flutter/material.dart';

class DropDownButtonHideUnderLineExample extends StatefulWidget {
  const DropDownButtonHideUnderLineExample({Key? key}) : super(key: key);

  @override
  State<DropDownButtonHideUnderLineExample> createState() =>
      _DropDownButtonHideUnderLineExampleState();
}

class _DropDownButtonHideUnderLineExampleState
    extends State<DropDownButtonHideUnderLineExample> {
  String? _selectedItem;
  final List<String> _dropdownItems = ['Item 1', 'Item 2', 'Item 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DropdownButton Example'),
      ),
      body: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            value: _selectedItem,
            items: _dropdownItems.map((item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedItem = value!;
              });
            },
            hint: const Text('Select Item'),
          ),
        ),
      ),
    );
  }
}
