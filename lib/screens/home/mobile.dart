import 'package:flutter/material.dart';
import 'package:travel_chain_mvp/screens/market/market_screen.dart';


class MobileScreen extends StatefulWidget {
  const MobileScreen({
    Key? key,
  }) : super(key: key);


  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {


  @override
  Widget build(BuildContext context) {
    print('Mobile version is running');
    return const Market();
  }
}