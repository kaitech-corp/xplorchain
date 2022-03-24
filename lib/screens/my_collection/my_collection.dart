import 'package:flutter/material.dart';
import 'package:travel_chain_mvp/services/cloud_functions/cloud_functions.dart';
import 'package:travel_chain_mvp/services/size_config/size_config.dart';

import '../../services/constants/constants.dart';


///Display of users NFT collection given wallet credentials.
///Current credentials are generated using DevNet credentials stored on a env file.
class MyCollection extends StatefulWidget{
  const MyCollection({Key? key}) : super(key: key);

  @override
  State<MyCollection> createState() => _MyCollectionState();
}

class _MyCollectionState extends State<MyCollection> {

  bool isPressed = false;
  bool isGetTokensPressed = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          color: canvasColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                        onPressed: (){
                          setState(() {
                            isPressed = !isPressed;
                          });
                        },
                        child: Text("Connect",style: Theme.of(context).textTheme.headline6,)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isGetTokensPressed = !isGetTokensPressed;
                          });
                      },
                        child: Text("Get Tokens",style: Theme.of(context).textTheme.headline6,)),
                  ),
                ],
              ),
              Center(
                child: FutureBuilder<String>(
                  future: isPressed ? CloudFunction().connectXRPL(): null,
                  builder: (context, response){
                    if(response.hasData){
                      return Text(response.data.toString());
                    } else{
                      return const Text("No wallet connected");
                    }
                  },
                ),
              ),
              Center(
                child: FutureBuilder<dynamic>(
                  future: isGetTokensPressed ? CloudFunction().getTokens() : null,
                  builder: (context, response){
                    if(response.hasData){
                      return Text(response.data.toString());
                    } else{
                      return const Text("No wallet connected");
                    }
                  },
                ),
              ),
            ],
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