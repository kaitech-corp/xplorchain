import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:travel_chain_mvp/services/constants/constants.dart';
import 'package:travel_chain_mvp/services/size_config/size_config.dart';


/// Custom app bar
class CustomAppBar extends StatelessWidget {

  const CustomAppBar({
    Key? key,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomShape(),
      child: Container(
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
                color: Colors.black,
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
              child: AppBar(
                toolbarHeight: SizerUtil.deviceType == DeviceType.tablet ? SizeConfig.screenHeight*.1 : SizeConfig.screenHeight*.075,
                shadowColor: const Color(0x00000000),
                backgroundColor: const Color(0x00000000),
                actions: <Widget>[
                  Center(
                    child: InkWell(
                      onTap: (){

                      },
                      child: Hero(
                        tag: "234",
                        transitionOnUserGestures: true,
                        child: CircleAvatar(
                          radius: SizeConfig.screenWidth/8.0,
                          backgroundImage: AssetImage(earthImage),
                        ),
                      ),
                    ),
                  ),
                ],
              )
          )
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double height = size.height;
    double width = size.width;
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