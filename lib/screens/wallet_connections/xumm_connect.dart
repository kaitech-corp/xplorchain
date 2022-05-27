import 'package:flutter/material.dart';
import 'package:travel_chain_mvp/services/locator.dart';
import 'package:travel_chain_mvp/services/navigation/route_names.dart';

import '../../services/cloud_functions/cloud_functions.dart';

///Connection screen for XUMM wallets
class XummConnection extends StatefulWidget{

  const XummConnection({Key? key}) : super(key: key);

  @override
  State<XummConnection> createState() => _XummConnectionState();
}

class _XummConnectionState extends State<XummConnection> {
  bool isPressed = false;

  bool isGetTokensPressed = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
              onPressed: (){
                setState(() {
                  isPressed = !isPressed;
                });
              },
              child: Text('Connect',style: Theme.of(context).textTheme.headline6,)),
        ),
        Center(
          child: FutureBuilder<dynamic>(
            future: isPressed ? CloudFunction().pingXUMM(): null,
            builder: (context, response){
              if(response.hasData){
                return Column(
                  children: [
                    Text(response.data.toString()),
                    ElevatedButton(
                      onPressed: (){
                        navigationService.navigateTo(myCollectionRoute);
                      },
                      child: Text('My Collection',style: Theme.of(context).textTheme.headline6,),
                    )
                  ],
                );
              } else{
                return const Text('No wallet connected');
              }
            },
          ),
        ),
      ],
    );
  }
}