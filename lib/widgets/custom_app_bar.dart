import 'package:flutter/material.dart';
import '../services/constants/constants.dart';
import '../services/size_config/size_config.dart';


/// Custom app bar
class CustomAppBar extends StatelessWidget {

  const CustomAppBar({
    Key? key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomShape(),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
          height: SizeConfig.screenHeight*.22,
          width: double.infinity,
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
              padding: const EdgeInsets.fromLTRB(8.0,0,8.0,0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){

                    },
                    child: Hero(
                      tag: '234',
                      transitionOnUserGestures: true,
                      child: CircleAvatar(
                        radius: SizeConfig.screenWidth*.1,
                        backgroundImage: const AssetImage(earthImage),
                      ),
                    ),
                  ),
                  const SizedBox(width: 4,),
                  Text('Travel-Chain', style: Theme.of(context).textTheme.headline4?.copyWith(fontWeight: FontWeight.bold),)
                ],
              )
              // AppBar(
              //   toolbarHeight: SizerUtil.deviceType == DeviceType.tablet ? SizeConfig.screenHeight*.1 : SizeConfig.screenHeight*.075,
              //   shadowColor: const Color(0x00000000),
              //   backgroundColor: const Color(0x00000000),
              //   actions: <Widget>[
              //     InkWell(
              //       onTap: (){
              //
              //       },
              //       child: Hero(
              //         tag: "234",
              //         transitionOnUserGestures: true,
              //         child: CircleAvatar(
              //           radius: SizeConfig.screenWidth/8.0,
              //           backgroundImage: AssetImage(earthImage),
              //         ),
              //       ),
              //     ),
              //     Text('Travel-Chain', style: Theme.of(context).textTheme.headline4?.copyWith(fontWeight: FontWeight.bold),)
              //   ],
              // )
          )
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    final double height = size.height;
    final double width = size.width;
    path.lineTo(0, height - 100);
    path.quadraticBezierTo(width / 2, height, width, height - 100);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}