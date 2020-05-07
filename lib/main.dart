import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_job_portal/ui/screens/profile.dart';
import 'package:flutter_job_portal/ui/screens/signin.dart';
import 'package:flutter_job_portal/ui/screens/signup.dart';
import 'package:flutter_job_portal/ui/screens/jobList.dart';

import 'package:flutter_job_portal/ui/screens/splashscreen.dart';
import 'package:flutter_job_portal/ui/screens/home.dart';
import 'package:provider/provider.dart';

import 'constants/constants.dart';
import 'models/bottomsheet.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ChangeNotifierProvider<MyBottomSheetModel>(
      create: (_) => MyBottomSheetModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CTSE Job Application',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'OpenSans',
        ),
        routes: <String, WidgetBuilder>{
        SPLASH_SCREEN: (BuildContext context) => SplashScreen(),
        SIGN_IN: (BuildContext context) => SignInPage(),
        SIGN_UP: (BuildContext context) => SignUpScreen(),
        HOME: (BuildContext context) => HomeScreen(),
        PROFILE: (BuildContext context) => ProfileScreen(),
          JOB_LIST: (BuildContext context) => JobListScreen(),
      },
      initialRoute: SPLASH_SCREEN,
      ),
    );
  }
}