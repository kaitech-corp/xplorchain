import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:travel_chain_mvp/screens/home/mobile.dart';
import 'package:travel_chain_mvp/screens/my_collection/my_collection.dart';
import 'package:travel_chain_mvp/screens/search/search.dart';
import 'package:travel_chain_mvp/screens/settings/settings.dart';
import 'package:travel_chain_mvp/widgets/custom_app_bar.dart';

import '../../services/size_config/size_config.dart';
import 'desktop.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = const <Widget>[
    MobileScreen(),
    Search(),
    MyCollection(),
    Settings(),
  ];

  void _onItemTapped(int index) {
    // FirebaseCrashlytics.instance.crash();
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return (kIsWeb) ? const Scaffold(
      body: SafeArea(
        child: DesktopScreen(),
      ),
    ) :
    Scaffold(
      body: Stack(
        children: [
          const CustomAppBar(),
          Padding(
            padding: EdgeInsets.only(
                top: SizeConfig.screenHeight*.1785),
            child: _widgetOptions.elementAt(_selectedIndex),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.black26,
        backgroundColor: Colors.black26,
        height: 75.0,
        items:  [
          Icon(Icons.home,size: 35,color: Theme.of(context).iconTheme.color,),
          Icon(Icons.search,size: 35,color: Theme.of(context).iconTheme.color,),
          Icon(Icons.photo_library,size: 35,color: Theme.of(context).iconTheme.color,),
          Icon(Icons.settings,size: 35,color: Theme.of(context).iconTheme.color,),
        ],
        onTap: _onItemTapped,

      ),
    );
  }
}





