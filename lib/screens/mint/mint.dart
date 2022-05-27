import 'package:flutter/material.dart';
import 'package:travel_chain_mvp/services/size_config/size_config.dart';

import '../../widgets/app_bar_web.dart';
import 'mint_form.dart';

/// Users can mint NFTs
class Mint extends StatelessWidget{

  const Mint({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                const AppBarWeb(),
                const SizedBox(height: 50,),
                Padding(
                    padding: EdgeInsets.only(left:SizeConfig.screenWidth*.2, right: SizeConfig.screenWidth*.2),
                    child: const MintForm()
                ),
              ],
            ),
          ),
        ));
  }
}

