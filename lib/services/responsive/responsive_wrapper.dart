import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

Widget ResponsiveWrapperBuilder(context, widget){
  return ResponsiveWrapper.builder(
    BouncingScrollWrapper.builder(context, widget),
    maxWidth: 1200,
    minWidth: 480,
    defaultScale: true,
    breakpoints: [
      const ResponsiveBreakpoint.resize(480, name: MOBILE),
      const ResponsiveBreakpoint.autoScale(800, name: TABLET),
      const ResponsiveBreakpoint.resize(1000, name: DESKTOP),
    ],
  );
}