import 'package:flutter/material.dart';

class ValueKeyExample extends StatefulWidget {
  const ValueKeyExample({Key? key}) : super(key: key);
  @override
  State<ValueKeyExample> createState() => _ValueKeyExampleState();
}

class _ValueKeyExampleState extends State<ValueKeyExample> {
  final TextEditingController textField1Controller = TextEditingController();
  final TextEditingController textField2Controller = TextEditingController();
  final ValueNotifier<bool> isTextField1Visible = ValueNotifier<bool>(true);
  // bool isTextField1Visible = true;
  final ValueNotifier<List<Widget>> valueList = ValueNotifier<List<Widget>>([
    const TextField(
      key: ValueKey("Framework"),
      decoration: InputDecoration(labelText: "Favourite Framework"),
    ),
    const TextField(
      key: ValueKey("Language"),
      decoration: InputDecoration(labelText: "Favourite Language"),
    ),
  ]);

  void swapValue() {
    valueList.value.insert(1, valueList.value.removeAt(0));
    valueList.value = List.of(valueList.value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ValueKey Example'),
      ),
      body: Column(
        children: [
          Column(
            children: [
              ValueListenableBuilder<List<Widget>>(
                valueListenable: valueList,
                builder:
                    (BuildContext context, List<Widget> value, Widget? child) {
                  return Column(
                    children: value,
                  );
                },
              ),
            ],
          ),
          ValueListenableBuilder(
            valueListenable: isTextField1Visible,
            builder: (context, value, child) {
              return Column(
                children: [
                  if (value)
                    const TextField(
                      /*using this value key here we can remove value togather textfiled if we not use a value key then it remove only
                      first textfield not there value*/
                      // key: ValueKey(1),
                      decoration: InputDecoration(
                        labelText: 'Text Field 1',
                      ),
                    ),
                  const TextField(
                    key: ValueKey(2),
                    decoration: InputDecoration(
                      labelText: 'Text Field 2',
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              isTextField1Visible.value = false;
            },
            child: const Icon(Icons.visibility_off),
          ),
          const SizedBox(
            width: 5,
          ),
          FloatingActionButton(
            onPressed: swapValue,
            child: const Icon(Icons.swap_horiz),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
// import 'package:flutter/material.dart';
//
// class ValueKeyExample extends StatefulWidget {
//   const ValueKeyExample({Key? key}) : super(key: key);
//
//   @override
//   State<ValueKeyExample> createState() => _ValueKeyExampleState();
// }
//
// class _ValueKeyExampleState extends State<ValueKeyExample> {
//   final TextEditingController textField1Controller = TextEditingController();
//   final TextEditingController textField2Controller = TextEditingController();
//   final ValueNotifier<bool> isTextField1Visible = ValueNotifier<bool>(true);
//   // bool isTextField1Visible = true;
//
//   List valueList = [
//     const TextField(
//       key: ValueKey("Framework"),
//       decoration: InputDecoration(labelText: "Favourite Framework"),
//     ),
//     const TextField(
//       key: ValueKey("Language"),
//       decoration: InputDecoration(labelText: "Favourite Language"),
//     ),
//   ];
//   swapValue() {
//     setState(() {
//       valueList.insert(1, valueList.removeAt(0));
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('ValueKey Example'),
//       ),
//       body: Column(
//         children: [
//           Column(
//             children: [
//               valueList[0],
//               valueList[1],
//             ],
//           ),
//           Column(
//             children: [
//               if (isTextField1Visible.value)
//                 const TextField(
//                   //using this value key here we can remove value togather textfiled if we not use a value key then it remove only first textfield not there value
//                   key: ValueKey(1),
//                   decoration: InputDecoration(
//                     labelText: 'Text Field 1',
//                   ),
//                 ),
//               const TextField(
//                 key: ValueKey(2),
//                 decoration: InputDecoration(
//                   labelText: 'Text Field 2',
//                 ),
//               ),
//             ],
//           )
//         ],
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           FloatingActionButton(
//               onPressed: () {
//                 setState(() {
//                   isTextField1Visible.value = false;
//                 });
//               },
//               child: const Icon(Icons.visibility_off)),
//           const SizedBox(
//             width: 5,
//           ),
//           FloatingActionButton(
//             onPressed: swapValue,
//             child: const Icon(Icons.swap_horiz),
//           ),
//         ],
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//     );
//   }
// }
