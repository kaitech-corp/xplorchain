import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:travel_chain_mvp/screens/menu/menu_drawer.dart';
import 'package:travel_chain_mvp/widgets/app_bar_animation_web.dart';

import '../../services/size_config/size_config.dart';
import 'web_home.dart';


///Home screen for switching between layouts for different devices.
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final ScrollController controller = ScrollController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      drawer: const MenuDrawer(),
      body: Column(
        children: [
          AppBarAnimationWeb(controller: controller,),
          WebHome(controller: controller)
        ],
      ),
    );
  }
}





