import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

import 'screens/home/home.dart';
import 'services/locator.dart';
import 'services/navigation/navigation_service.dart';
import 'services/navigation/router.dart';
import 'services/project_initializer/project_initializer.dart';
import 'services/responsive/responsive_wrapper.dart';
import 'services/responsive/scroll_behavior.dart';

void main() async {
  ///Initialize get it locator and find current locale.
  // findSystemLocale().then((value) => print(value.toString()));
  projectInitializer();
  
  runApp(const MyApp());
}
/// This widget is the root of the application.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Sizer(
      builder: (BuildContext context,Orientation orientation, DeviceType deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          scrollBehavior: MyCustomScrollBehavior(),
          title: 'Xplorchain',
          theme: ThemeData(
            fontFamily: GoogleFonts.playfairDisplay().fontFamily,
            textTheme: GoogleFonts.playfairDisplayTextTheme(
                Theme.of(context).textTheme
            ),
          ),
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.dark,
          builder: (BuildContext context, Widget? widget) {
            return responsiveWrapperBuilder(context, widget);
          },
          home: const MyHomePage(),
          navigatorKey: locator<NavigationService>().navigationKey,
          onGenerateRoute: generateRoute,
        );
      }
    );
  }
}


