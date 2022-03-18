

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_chain_mvp/screens/nft_details/nft_details.dart';
import 'package:travel_chain_mvp/screens/nft_details/nft_details_desktop.dart';
import 'package:travel_chain_mvp/services/constants/constants.dart';
import 'package:travel_chain_mvp/services/navigation/route_names.dart';
import 'package:travel_chain_mvp/services/size_config/size_config.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  final dynamic args = settings.arguments;
  switch (settings.name) {
    case nftDetailsRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: NFTDetails(model: args,),
      );
    case nftDetailsDesktopRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: NFTDetailsDesktop(model: args,),
      );
    // case AddNewActivityRoute:
    //   return _getPageRoute(
    //     routeName: settings.name,
    //     viewToShow: AddNewActivity(trip: args,),
    //   );
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(
              title: const Text('Oops!'),
            ),
            body: Center(
                child: Column(
                  children: [
                    const SizedBox(height: 10,),
                    Image.asset(error,fit: BoxFit.cover,width: SizeConfig.screenWidth*.9,height: SizeConfig.screenWidth*.9,),
                    const Text('Something went wrong. Sorry about that.',textScaleFactor: 1.5,textAlign: TextAlign.center,style: TextStyle(color: Colors.redAccent),),
                    const SizedBox(height: 10,),
                    const Text('Be sure to check your network connection just in case.',textScaleFactor: 1.5,textAlign: TextAlign.center,),
                  ],
                )),
          ));
  }
}

CupertinoPageRoute _getPageRoute({String? routeName, required Widget viewToShow }) {
  return CupertinoPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (BuildContext context) => viewToShow);
}