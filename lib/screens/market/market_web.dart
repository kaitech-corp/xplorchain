import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/models.dart';
import '../../services/constants/constants.dart';
import '../../services/locator.dart';
import '../../services/navigation/route_names.dart';
import '../../services/size_config/size_config.dart';
import '../../widgets/sliver_grid_view.dart';

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
          child: Text(Intl.message('Local Artists'), style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: SizeConfig.screenHeight/3,
          width: double.infinity,
          child: const SliverGridView(tag: ' 001',plus: 0,)

        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(Intl.message('Point of Interests'), style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),),
        ),
        SizedBox(
          height: SizeConfig.screenHeight/3,
          width: double.infinity,
          child: const SliverGridView(tag: ' 002',plus: 3,)
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(Intl.message('Hot Destinations'), style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),),
        ),
        SizedBox(
          height: SizeConfig.screenHeight/3,
          width: SizeConfig.screenWidth,
          child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index){
                return NFTCollectionAvatar(index: '$index 004');
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(Intl.message('Nearby Gems'), style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),),
        ),
        Center(
          child: SizedBox(
            height: SizeConfig.screenHeight/3,
            width: SizeConfig.screenWidth*.5,
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                autoPlayAnimationDuration: const Duration(seconds: 3),
              ),
              items: List.generate(5, (int index) => NFTCollection(index: '$index 003')),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(Intl.message('Popular Destinations'), style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),),
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
              itemBuilder: (BuildContext context, int index){
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

  const NFTCollection({required this.index, Key? key}) : super(key: key);

  final String index;

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

  const NFTCollectionAvatar({required this.index, Key? key}) : super(key: key);

  final String index;

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