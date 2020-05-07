import 'package:flutter/material.dart';
import 'package:flutter_job_portal/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'mybottomnavitem.dart';
import '../screens/jobList.dart';
class MyBottomNavBar extends StatefulWidget {
  final int pId;
  const MyBottomNavBar({
    Key key,
    this.pId
  }) : super(key: key);

  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {

  int _active = 0;
  @override
  Widget build(BuildContext context) {
    _active = widget.pId;
    return Container(
      padding: EdgeInsets.all(5.0),
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          MyBottomNavItem(
            text: "Search",
            icon: Icons.search,
            id: 0,
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setInt("btId", 0);
              Navigator.of(context).pushNamed(HOME);
              setState(() {
                _active = prefs.getInt("btId");
              });
            },
            active: _active,
          ),
          MyBottomNavItem(
            text: "Map",
            icon: Icons.map,
            id: 1,
            onPressed: () {

              setState(() {
                _active = 1;

              });
            },
            active: _active,
          ),
          MyBottomNavItem(
            text: "Decisions",
            icon: Icons.flight_takeoff,
            id: 2,
            onPressed: () {
              setState(() {
                _active = 2;
              });
            },
            active: _active,
          ),
          MyBottomNavItem(
            text: "Jobs",
            icon: Icons.work,
            id: 3,
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setInt("btId", 3);
              Navigator.of(context).pushNamed(JOB_LIST);
              setState(() {
                _active = prefs.getInt("btId");
              });
            },
            active:_active,
          ),
        ],
      ),
    );
  }
   static Future<int> GetActive() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt("btId");
  }
}
