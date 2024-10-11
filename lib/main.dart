import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webtoons/screens/portfolio_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812), // match design size
      minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(debugShowCheckedModeBanner: false,
            home: PortfolioPage(),
          );
        }

    );
  }
}
