import 'package:flutter/material.dart';
import '../services/constants/constants.dart';
import '../services/locator.dart';
import '../services/navigation/route_names.dart';
import '../services/size_config/size_config.dart';

///Static App Bar
class AppBarWeb extends StatelessWidget {

  const AppBarWeb({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: SizeConfig.screenHeight * .13,
        width: double.infinity,
        // clipBehavior: ,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.black26,
                Colors.lightBlueAccent
              ]
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 10.0,
            ),
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Padding(
            padding: EdgeInsets.fromLTRB(appBarDefaultPadding*2,0,appBarDefaultPadding,0),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: (){
                          navigationService.navigateTo(homeRoute);
                        },
                        child: Hero(
                          tag: '234',
                          transitionOnUserGestures: true,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: SizeConfig.screenWidth*.035,
                              backgroundImage: const AssetImage(earthImage),
                            ),
                          ),
                        ),
                      ),
                      Text('XplorChain', style: Theme.of(context).textTheme.headline4?.copyWith(fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(
                          height: SizeConfig.screenHeight*.05,
                          width: SizeConfig.screenWidth*.25,
                          child: const TextField()),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(onPressed: ()=>navigationService.navigateTo(loginRoute), child: Text('Account', style: Theme.of(context).textTheme.headline6,)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(onPressed: ()=>navigationService.navigateTo(mintRoute), child: Text('Mint', style: Theme.of(context).textTheme.headline6,)),
                      ),
                    ],
                  )
                ],
              ),
            )
        )
    );
  }
}
