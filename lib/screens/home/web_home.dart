import 'package:flutter/material.dart';
import '../market/market_web.dart';

/// Web view
class WebHome extends StatelessWidget {

  const WebHome({
    required this.controller, Key? key,
  }) : super(key: key);

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
          controller: controller,
          child: const Padding(
            padding: EdgeInsets.all(16.0),
            child: MarketWeb(),
          )),
    );
  }
}