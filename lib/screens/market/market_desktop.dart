import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_chain_mvp/models/nft_details.dart';
import 'package:travel_chain_mvp/screens/home/home.dart';
import 'package:travel_chain_mvp/services/locator.dart';
import 'package:travel_chain_mvp/services/navigation/route_names.dart';
import 'package:travel_chain_mvp/services/size_config/size_config.dart';

import '../../services/constants/constants.dart';


class MarketDesktop extends StatelessWidget{
  const MarketDesktop({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Freshly Minted", style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold)),
        ),
        SizedBox(
          height: SizeConfig.screenHeight/3,
          width: double.infinity,
          child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                return NFTCollection(index: '$index 001');
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Popular Destinations", style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),),
        ),
        SizedBox(
          height: SizeConfig.screenHeight/3,
          width: double.infinity,
          child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                return NFTCollection(index: '$index 002');
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Hot Collections", style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),),
        ),
        SizedBox(
          height: SizeConfig.screenHeight/3,
          width: double.infinity,
          child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                return NFTCollectionAvatar(index: '$index 004');
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Nearby Gems', style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),),
        ),
        SizedBox(
          height: SizeConfig.screenHeight/3,
          width: double.infinity,
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
        Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Travel Experiences', style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),),
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

class NFTCollection extends StatelessWidget{

  final String index;

  const NFTCollection({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        navigationService.navigateTo(nftDetailsDesktopRoute, arguments: NFTDetailsModel(index: index));
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

class NFTCollectionAvatar extends StatelessWidget{

  final String index;

  const NFTCollectionAvatar({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        navigationService.navigateTo(nftDetailsDesktopRoute, arguments: NFTDetailsModel(index: index));
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
                    radius: SizeConfig.screenWidth/3,
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