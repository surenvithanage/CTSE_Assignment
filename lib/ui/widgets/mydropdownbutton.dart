import 'package:flutter/material.dart';
class MyDropDownButton extends StatefulWidget {
  const MyDropDownButton({
    Key key,
  }) : super(key: key);

  @override
  _MyDropDownButtonState createState() => _MyDropDownButtonState();
}

class _MyDropDownButtonState extends State<MyDropDownButton> {
  int _active = 0;
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      underline: Container(),
      onChanged: (f) => _active = f,
      value: _active,
      style: Theme.of(context).textTheme.headline,
      items: [
        DropdownMenuItem(child: Text("Project manager", style: TextStyle(fontSize: 11.0)), value: 0),
        DropdownMenuItem(child: Text("Business analyst", style: TextStyle(fontSize: 11.0)), value: 1),
        DropdownMenuItem(child: Text("Business manager", style: TextStyle(fontSize: 11.0)), value: 2),
        DropdownMenuItem(child: Text("Information technology", style: TextStyle(fontSize: 11.0)), value: 3),
        DropdownMenuItem(child: Text("Manufacturing", style: TextStyle(fontSize: 11.0)), value: 4),
      ],
    );
  }
}
