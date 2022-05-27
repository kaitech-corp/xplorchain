import 'package:flutter/material.dart';
import 'package:travel_chain_mvp/screens/market/market_web.dart';

/// Web view
class WebHome extends StatelessWidget {

  final ScrollController controller;

  const WebHome({
    required this.controller, Key? key,
  }) : super(key: key);

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