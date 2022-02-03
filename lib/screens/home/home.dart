import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:nfkeychain_mvp/screens/home/mobile.dart';
import 'package:nfkeychain_mvp/screens/market/market_screen.dart';
import 'package:nfkeychain_mvp/screens/menu/slider_menu.dart';
import 'package:nfkeychain_mvp/services/size_config/size_config.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,}) : super(key: key);



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<SliderMenuContainerState> _key =
   GlobalKey<SliderMenuContainerState>();


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: SliderMenuContainer(
          key: _key,
          appBarColor: Colors.greenAccent,
            sliderMenuOpenSize: 200,
            title: const Text(
              'NF🗝Chain',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
            // Text('NFKey🗝Chain')
            sliderMenu: const SliderMenu(),
            sliderMain: const Market()),
      ),
    );
  }
}



