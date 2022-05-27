import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_chain_mvp/models/models.dart';
import 'package:travel_chain_mvp/services/locator.dart';
import 'package:travel_chain_mvp/services/navigation/route_names.dart';
import 'package:travel_chain_mvp/services/size_config/size_config.dart';
import 'package:travel_chain_mvp/widgets/sliver_grid_view.dart';

import '../../services/constants/constants.dart';

/// Market screen. Web version.
class MarketWeb extends StatelessWidget{

  const MarketWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Local Artists", style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: SizeConfig.screenHeight/3,
          width: double.infinity,
          child: const SliverGridView(tag: ' 001',plus: 0,)

        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Point of Interests", style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),),
        ),
        SizedBox(
          height: SizeConfig.screenHeight/3,
          width: double.infinity,
          child: const SliverGridView(tag: ' 002',plus: 3,)
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Hot Destinations", style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),),
        ),
        SizedBox(
          height: SizeConfig.screenHeight/3,
          width: SizeConfig.screenWidth,
          child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                return NFTCollectionAvatar(index: '$index 004');
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Nearby Gems', style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),),
        ),
        Center(
          child: SizedBox(
            height: SizeConfig.screenHeight/3,
            width: SizeConfig.screenWidth*.5,
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                autoPlayAnimationDuration: const Duration(seconds: 3),
                // aspectRatio: 2,
                enlargeCenterPage: false,
              ),
              items: List.generate(5, (index) => NFTCollection(index: '$index 003')),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Popular Destinations", style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),),
              // Text('# of NFKeychains', style: Theme.of(context).textTheme.subtitle2),
            ],
          ),
        ),
        SizedBox(
          height: SizeConfig.screenHeight/3,
          width: double.infinity,
          // padding: const EdgeInsets.all(8.0),
          // color: Colors.blueGrey,
          child: ListView.builder(
              itemCount: 4,
              itemBuilder: (context, index){
                return Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  color: Colors.black,
                  child: ListTile(
                    title: Text(locations[index],style: Theme.of(context).textTheme.headline6,),
                    trailing: Text('${nftCount[index]}'),
                  ),
                );
              }),
        )
      ],
    );
  }
}

/// Demo of displaying nft collections.
class NFTCollection extends StatelessWidget{

  final String index;

  const NFTCollection({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        navigationService.navigateTo(nftDetailsRoute, arguments: NFTDetailsModel(index: index));
      },
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
        ),
        margin: EdgeInsets.all(SizeConfig.screenWidth*.05),
        child: Hero(
          tag: index,
          child: SizedBox(
            height: 175.0,
            width: 175.0,
            // color: canvasColor,
            child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                child: Image.asset('assets/images/${index[0]}.png',fit: BoxFit.fill,)),
          ),
        ),
      ),
    );
  }
}

/// Demo of displaying nft collections. Circle Avatar view.
class NFTCollectionAvatar extends StatelessWidget{

  final String index;

  const NFTCollectionAvatar({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        navigationService.navigateTo(nftDetailsRoute, arguments: NFTDetailsModel(index: index));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          child: Column(
            children: [
              Expanded(
                child: Hero(
                  tag: index,
                  child: CircleAvatar(
                    radius: SizeConfig.screenWidth/8,
                    backgroundImage: AssetImage('assets/images/${index[0]}.png',),
                  ),
                ),
              ),
              Text(nftCollections[int.parse(index[0])],textAlign: TextAlign.center,)
            ],
          ),
        ),
      ),
    );
  }
}