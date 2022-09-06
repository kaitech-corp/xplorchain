

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../screens/home/home.dart';
import '../../screens/login/login.dart';
import '../../screens/mint/mint.dart';
import '../../screens/my_collection/my_collection.dart';
import '../../screens/nft_details/nft_details.dart';
import '../constants/constants.dart';
import '../size_config/size_config.dart';
import 'route_names.dart';


///Navigation routes
Route<dynamic> generateRoute(RouteSettings settings) {
  final dynamic args = settings.arguments;
  switch (settings.name) {
    case loginRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const Login(),
      );
    case nftDetailsRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: NFTDetails(model: args,),
      );
    case mintRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const Mint(),
      );
    case myCollectionRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const MyCollection(),
      );
    case homeRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: const MyHomePage(),
      );
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

CupertinoPageRoute _getPageRoute({ required Widget viewToShow, String? routeName }) {
  return CupertinoPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (BuildContext context) => viewToShow);
}