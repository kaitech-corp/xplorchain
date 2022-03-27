import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:travel_chain_mvp/services/locator.dart';
import 'package:travel_chain_mvp/services/responsive/scroll_behavior.dart';

import 'screens/home/home.dart';
import 'services/navigation/navigation_service.dart';
import 'services/navigation/router.dart';
import 'services/project_initializer/project_initializer.dart';
import 'services/responsive/responsive_wrapper.dart';

void main() async {
  ///Initialize get it locator.
  projectInitializer();
  
  runApp(const MyApp());
}
/// This widget is the root of the application.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Sizer(
      builder: (context,orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          scrollBehavior: MyCustomScrollBehavior(),
          title: 'NFKeychain',
          theme: ThemeData(
            fontFamily: GoogleFonts.playfairDisplay().fontFamily,
            textTheme: GoogleFonts.playfairDisplayTextTheme(
                Theme.of(context).textTheme
            ),
          ),
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.dark,
          builder: (context, widget) {
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


