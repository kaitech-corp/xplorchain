
import 'package:flutter/material.dart';
import '../services/constants/constants.dart';
import '../services/locator.dart';
import '../services/navigation/route_names.dart';
import '../services/size_config/size_config.dart';

///App Bar animation
class AppBarAnimationWeb extends StatefulWidget {

  const AppBarAnimationWeb({
    required this.controller, Key? key,
  }) : super(key: key);

  final ScrollController controller;

  @override
  _AppBarAnimationWebState createState() => _AppBarAnimationWebState();
}

class _AppBarAnimationWebState extends State<AppBarAnimationWeb> {

  double _height = SizeConfig.screenHeight*.18;
  double _arcHeight = 100;

  @override
  void initState() {
    widget.controller.addListener(onScroll);
    super.initState();
  }

  void onScroll() {
    if(mounted){
      if (widget.controller.offset < 100) {
        setState(() {
          _height = SizeConfig.screenHeight * .18 -
              SizeConfig.screenHeight * .1 * (widget.controller.offset / 100);
          _arcHeight = 100 - widget.controller.offset * .85;
        });
      } else {
        setState(() {
          _height = SizeConfig.screenHeight * .13;
          _arcHeight = 0;
        });
      }
    }
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper: ArcShape(x: 0, y: _arcHeight),
        child:  AnimatedContainer(
            duration: animationDuration,
            height: _height,
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
        ));
  }
}


class ArcShape extends CustomClipper<Path> {
  ArcShape({required this.x, required this.y});
  double x;
  double y;

  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, size.height - y);
    //Adds a quadratic bezier segment that curves from the current point
    //to the given point (x2,y2), using the control point (x1,y1).
    path.quadraticBezierTo(
        size.width / 4, size.height - x, size.width / 2, size.height - x);
    path.quadraticBezierTo(
        size.width * 3 / 4, size.height - x, size.width, size.height - y);

    path.lineTo(size.width, 0.0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}