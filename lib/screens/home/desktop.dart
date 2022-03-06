import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:travel_chain_mvp/screens/market/market_screen.dart';
import 'package:travel_chain_mvp/screens/menu/slider_menu.dart';
import 'package:travel_chain_mvp/services/size_config/size_config.dart';


class DesktopScreen extends StatefulWidget {
  const DesktopScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DesktopScreen> createState() => _DesktopScreenState();
}

class _DesktopScreenState extends State<DesktopScreen> {


  @override
  Widget build(BuildContext context) {
    print('Desktop version is running');
    return SliderDrawer(
        key: widget.key,
        sliderOpenSize: 200,
        appBar: SliderAppBar(
          drawerIcon: const Icon(Icons.menu,size: 35,),
          // drawerIconSize: 75,
          appBarHeight: SizeConfig.screenHeight/8,
          appBarColor: Colors.black26,
          title: const Text("Welcome"),
        ),
        // Text('NFKey🗝Chain')
        slider: const SliderMenu(),
        child: const Market());
  }
}