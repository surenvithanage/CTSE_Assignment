import 'package:flutter/material.dart';
class JobTypesDropDown extends StatefulWidget {
  const JobTypesDropDown({
    Key key,
  }) : super(key: key);

  @override
  _JobTypesDropDown createState() => _JobTypesDropDown();
}

class _JobTypesDropDown extends State<JobTypesDropDown> {
  int _active = 0;
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      underline: Container(),
      onChanged: (f) => _active = f,
      value: _active,
      style: Theme.of(context).textTheme.headline,
      items: [
        DropdownMenuItem(child: Text("Part Time", style: TextStyle(fontSize: 16.0)), value: 0),
        DropdownMenuItem(child: Text("Full Time", style: TextStyle(fontSize: 16.0)), value: 1),
//
      ],
    );
  }
}
