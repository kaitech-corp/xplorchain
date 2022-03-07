import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_chain_mvp/services/size_config/size_config.dart';

import '../../services/constants/constants.dart';




class Market extends StatelessWidget{
  const Market({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Freshly Minted", style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold)),
              // Text('View all', style: Theme.of(context).textTheme.subtitle2),
            ],
          ),
        ),
        SizedBox(
          height: SizeConfig.screenHeight/4,
          width: double.infinity,
          child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                return NFTCollection(index: index);
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Popular Destinations", style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),),
              // Text('View all', style: Theme.of(context).textTheme.subtitle2),
            ],
          ),
        ),
        SizedBox(
          height: SizeConfig.screenHeight/4,
          width: double.infinity,
          child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                return NFTCollection(index: index);
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Hot Collections", style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),),
              // Text('View all', style: Theme.of(context).textTheme.subtitle2),
            ],
          ),
        ),
        SizedBox(
          height: SizeConfig.screenHeight/4,
          width: double.infinity,
          child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
                return NFTCollectionAvatar(index: index);
              }),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Nearby Gems', style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),),
              // Text('View all', style: Theme.of(context).textTheme.subtitle2),
            ],
          ),
        ),
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            autoPlayAnimationDuration: const Duration(seconds: 3),
            aspectRatio: 1.75,
            enlargeCenterPage: true,
          ),
          items: List.generate(5, (index) => NFTCollection(index: index)),
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
          height: SizeConfig.screenHeight/4,
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

  final int index;

  const NFTCollection({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      margin: EdgeInsets.all(SizeConfig.screenWidth*.05),
      child: Container(
        constraints: const BoxConstraints.expand(
          height: 175.0,
          width: 175.0,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: canvasColor,
        ),
        // color: canvasColor,
        child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            child: Image.asset('assets/images/$index.png',fit: BoxFit.fill,)),
      ),
    );
  }
}

class NFTCollectionAvatar extends StatelessWidget{

  final int index;

  const NFTCollectionAvatar({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        child: Column(
          children: [
            CircleAvatar(
              radius: SizeConfig.screenWidth/5,
              backgroundImage: AssetImage('assets/images/$index.png',),
            ),
            Text(nftCollections[index],textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }
}