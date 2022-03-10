import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../services/constants/constants.dart';



class Search extends StatelessWidget{
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('My Keychains', style: Theme.of(context).textTheme.headline5,),
                  Text('view all', style: Theme.of(context).textTheme.subtitle2),
                ],
              ),
            ),
            // ListView.builder(
            //   itemCount: ,
            //   itemBuilder: (context, index){
            //     return ListTile(
            //
            //     )
            //   })
          ],
      ),
    );
  }

}

class NFTCollection extends StatelessWidget{

  final int index;

  const NFTCollection({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      width: 175,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: canvasColor,
      ),
      // color: canvasColor,
      child: Image.asset('assets/images/$index.png',fit: BoxFit.fill,),
    );
  }
}