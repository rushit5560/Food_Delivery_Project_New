import 'package:flutter/material.dart';

class ZDropDownScreen extends StatefulWidget {
  const ZDropDownScreen({Key? key}) : super(key: key);

  @override
  State<ZDropDownScreen> createState() => _ZDropDownScreenState();
}

class _ZDropDownScreenState extends State<ZDropDownScreen> {
  List<String>? items ; /*= ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5', 'Item 6'];*/
  String? value;

  @override
  void initState() {
    items = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5', 'Item 6'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Drop Down List Example')),

      body: Center(
        child: DropdownButton<String>(
          value: value,
          items: items!.map(buildMenuItem).toList(),
          onChanged: (value) {
            setState(() {
              this.value = value;
              print('${this.value}');
            });
          },
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );
}
