import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_chain_mvp/services/locator.dart';
import 'package:travel_chain_mvp/services/navigation/route_names.dart';

import '../../services/cloud_functions/cloud_functions.dart';

///Connection screen for DevNet
class DevNetConnection extends StatefulWidget{

  const DevNetConnection({Key? key}) : super(key: key);

  @override
  State<DevNetConnection> createState() => _DevNetConnectionState();
}

class _DevNetConnectionState extends State<DevNetConnection> {
  bool isPressed = false;

  bool isGetTokensPressed = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Builder(
              builder: (context) => Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      enableInteractiveSelection: true,
                      textCapitalization: TextCapitalization.words,
                      initialValue: '',
                      decoration: const InputDecoration(
                        labelText: 'Public Address',
                        // enabledBorder: UnderlineInputBorder(
                        //   borderSide: BorderSide(color: ReusableThemeColor().colorOpposite(context)),
                        // )
                      ),
                      // ignore: missing_return
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter public address';
                          // ignore: missing_return
                        }
                      },
                    ),
                    TextFormField(
                      enableInteractiveSelection: true,
                      textCapitalization: TextCapitalization.words,
                      initialValue: '',
                      decoration: const InputDecoration(
                        labelText: 'Secret',
                        // enabledBorder: UnderlineInputBorder(
                        //   borderSide: BorderSide(color: ReusableThemeColor().colorOpposite(context)),
                        // )
                      ),
                      // ignore: missing_return
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter secret';
                          // ignore: missing_return
                        }
                      },
                    ),
                  ],
                ),
              )),
        ),
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
        Center(
          child: FutureBuilder<String>(
            future: isPressed ? CloudFunction().connectXRPL(): null,
            builder: (context, response){
              if(response.hasData){
                return Column(
                  children: [
                    Text(response.data.toString()),
                    ElevatedButton(
                      onPressed: (){
                        navigationService.navigateTo(myCollectionRoute);
                      },
                      child: Text("My Collection",style: Theme.of(context).textTheme.headline6,),
                    )
                  ],
                );
              } else{
                return const Text("No wallet connected");
              }
            },
          ),
        ),
      ],
    );
  }
}