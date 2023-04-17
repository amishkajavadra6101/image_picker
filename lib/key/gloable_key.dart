import 'package:flutter/material.dart';

class GlobalKeyExample extends StatefulWidget {
  const GlobalKeyExample({Key? key}) : super(key: key);

  @override
  State<GlobalKeyExample> createState() => _GlobalKeyExampleState();
}

class _GlobalKeyExampleState extends State<GlobalKeyExample> {
  /*GlobalKey is used to uniquely identify the widget and
  By using a GlobalKey, we can access the current state of these widgets and perform actions on them, like validating the form when the submitForm
  function is calle*/
  final _formKey = GlobalKey<FormState>();
  final _textKey = GlobalKey<FormFieldState>();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      String textValue = _textKey.currentState!.value.toString();
      print('Text input: $textValue');
    }
  }

  void _resetForm() {
    _formKey.currentState!.reset();
    _textKey.currentState!.reset();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gloabal key Example'),
      ),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  key: _textKey,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _submitForm,
                      child: const Text('Submit'),
                    ),
                    const SizedBox(width: 16.0),
                    OutlinedButton(
                      onPressed: _resetForm,
                      child: const Text('Reset'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
