import 'package:flutter/material.dart';
import '../market/market_web.dart';

import '../my_collection/my_collection.dart';

///Example Slider Menu
class SliderMenu extends StatelessWidget {
  const SliderMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        const CircleAvatar(
          radius: 50.0,
        ),
        const SizedBox(height: 50,),
        ListTile(
          title: Text('Profile',style: Theme.of(context).textTheme.headline5,),
          onTap: (){

          },
        ),
        ListTile(
            title: Text('My Collection',style: Theme.of(context).textTheme.headline5,),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext context) => const MyCollection()),
            );
          },
        ),
        ListTile(
            title:Text('Market',style: Theme.of(context).textTheme.headline5,),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext context) => const Padding(
                padding: EdgeInsets.all(8.0),
                child: MarketWeb(),
              )),
            );
          },
        ),
        ListTile(
          title: Text('Settings',style: Theme.of(context).textTheme.headline5,),
        ),
      ],);
  }
}