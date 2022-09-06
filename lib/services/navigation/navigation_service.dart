import 'package:flutter/material.dart';

///Navigation service
class NavigationService {

  final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  void pop() {
    return _navigationKey.currentState?.pop();
  }

  Future<dynamic>? pushReplacementNamed(String routeName){
    return _navigationKey.currentState?.pushReplacementNamed(routeName);
  }

  Future<dynamic>? pushNamedAndRemoveUntil(String routeName){
    return _navigationKey.currentState?.pushNamedAndRemoveUntil(routeName, (Route route) => false);
  }

  Future<dynamic>? navigateTo(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState?.pushNamed(routeName, arguments: arguments);
  }

}