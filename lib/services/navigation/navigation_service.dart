import 'package:flutter/material.dart';

///Navigation service
class NavigationService {

  final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  void pop() {
    return _navigationKey.currentState?.pop();
  }

  Future<Object?>? pushReplacementNamed(String routeName){
    return _navigationKey.currentState?.pushReplacementNamed(routeName);
  }

  Future<Object?>? pushNamedAndRemoveUntil(String routeName){
    return _navigationKey.currentState?.pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  Future<Object?>? navigateTo(String routeName, {dynamic arguments}) {
    return _navigationKey.currentState?.pushNamed(routeName, arguments: arguments);
  }

}