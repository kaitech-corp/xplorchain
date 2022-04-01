import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:travel_chain_mvp/screens/wallet_connections/devnet_connect.dart';
import 'package:travel_chain_mvp/screens/wallet_connections/xumm_connect.dart';
import 'package:travel_chain_mvp/services/size_config/size_config.dart';

import '../../services/constants/constants.dart';
import '../../widgets/app_bar_web.dart';


///Display of users NFT collection given wallet credentials.
///Current credentials are generated using DevNet credentials stored on a env file.
class Login extends StatelessWidget{
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: Column(
            children: [
              const AppBarWeb(),
              const SizedBox(height: 50,),
              Center(
                child: SizedBox(
                  height: SizeConfig.screenHeight*.5,
                  width: SizeConfig.screenWidth*.33,
                  child: Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    semanticContainer: false,
                    color: Colors.black87,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Sign In",style: Theme.of(context).textTheme.headline4,textAlign: TextAlign.start,),
                        Text("Choose an available wallet provider below", style: Theme.of(context).textTheme.subtitle1,),
                        SizedBox(height: SizeConfig.screenHeight*.01,),
                        Center(
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            color: Colors.white30,
                            child: TabBar(
                              unselectedLabelStyle: Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.black),
                              labelStyle: Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.blueAccent),
                              tabs: <Widget>[
                                Tab(
                                    icon: SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: SvgPicture.asset(xrpIcon,color: Colors.black,),),
                                    text:"Devnet"),
                                Tab(
                                  icon: SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: SvgPicture.asset(xrpIcon,color: Colors.black,),),
                                  text: "XRPL",
                                ),
                                Tab(
                                    icon: SizedBox(
                                      height: 24,
                                      width: 24,
                                      child: SvgPicture.asset(xrpIcon,color: Colors.black,),),
                                    text:"XUMM"),
                              ],
                            ),
                          ),
                        ),
                        const Expanded(
                          child: TabBarView(
                            children: <Widget>[
                              DevNetConnection(),
                              Text('XRPL'),
                              XummConnection(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NFTCollection extends StatelessWidget{

  final int index;

  const NFTCollection({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      width: 175,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: canvasColor,
      ),
      // color: canvasColor,
      child: Image.asset('assets/images/$index.png',fit: BoxFit.fill,),
    );
  }
}