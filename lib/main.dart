import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'screens/home/home.dart';
import 'services/responsive/responsive_wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  Sizer(
      builder: (context,orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'NFKeychain',
          theme: ThemeData.dark(

          ),
          builder: (context, widget) {
            return ResponsiveWrapperBuilder(context, widget);
          },
          home: const MyHomePage(),
        );
      }
    );
  }
}


