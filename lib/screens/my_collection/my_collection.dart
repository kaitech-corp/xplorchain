import 'package:flutter/material.dart';
import 'package:image_network/image_network.dart';
import '../../models/models.dart';
import '../../services/cloud_functions/cloud_functions.dart';
import '../../services/size_config/size_config.dart';

import '../../widgets/app_bar_animation_web.dart';


///Display of users NFT collection given wallet credentials.
///Current credentials are generated using DevNet credentials stored on a env file.
class MyCollection extends StatefulWidget{
  const MyCollection({Key? key}) : super(key: key);

  @override
  State<MyCollection> createState() => _MyCollectionState();
}

class _MyCollectionState extends State<MyCollection> {

  final ScrollController controller = ScrollController();
  bool showMetaData = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarAnimationWeb(controller: controller,),
              const SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('My Collection',style: Theme.of(context).textTheme.headline4,),
              ),
              ///Example Future to retrieve nft and metadata. Will convert to bloc pattern style.
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  height: SizeConfig.screenHeight*.5,
                  width: double.infinity,
                  child: FutureBuilder(
                    future: CloudFunction().getTokens(),
                    builder: (BuildContext context, AsyncSnapshot<dynamic> response){
                      if(response.hasData){
                        final results = response.data['result']['account_nfts'];
                        final data = results.map((result) => AccountNFTs.fromJSON(result)).toList();
                        return ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int index){
                            final AccountNFTs nft = data[index];
                            return Card(
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(15))
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                      height: SizeConfig.screenHeight*.3,
                                      width: SizeConfig.screenHeight*.3,
                                      child: FutureBuilder(
                                        future: CloudFunction().convertHexToString(nft.uri.toString()),
                                        builder: (BuildContext context, AsyncSnapshot<String> response){
                                          if(response.hasData){
                                            return GestureDetector(
                                              onTap: (){
                                                setState(() {
                                                  showMetaData = !showMetaData;
                                                });
                                              },
                                              child: ImageNetwork(
                                                image: response.data.toString(),
                                                height: SizeConfig.screenHeight*.3,
                                                width: SizeConfig.screenHeight*.3,
                                              ),
                                            );
                                          } else {
                                            return const Text('Error Loading NFT');
                                          }
                                        },
                                      )
                                  ),
                                  Text('Issuer: ${nft.issuer}'),
                                  Text('TokenID: ${nft.tokenID}'),
                                  Visibility(
                                    visible: showMetaData,
                                    child: Column(
                                      
                                    ))
                                ],
                              ),
                            );
                          },
                        );
                        } else {
                        return const Text('Error retrieving data.');
                      }
                    }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
