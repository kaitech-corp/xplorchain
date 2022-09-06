import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readmore/readmore.dart';
import '../../models/models.dart';
import '../../services/constants/constants.dart';
import '../../services/constants/functions.dart';
import '../../services/size_config/size_config.dart';

import '../market/market_web.dart';

/// Details page for NFTs
class NFTDetails extends StatefulWidget {

  const NFTDetails({required this.model, Key? key}) : super(key: key);

  final NFTDetailsModel model;

  @override
  State<NFTDetails> createState() => _NFTDetailsState();
}

class _NFTDetailsState extends State<NFTDetails> {

  final double _height = SizeConfig.screenHeight*.45;
  final double _width = SizeConfig.screenWidth*.5;
  int x = randomNumber();
  int y = randomNumber();
  double animatedScale = 1.0;

  bool expanded = false;


  void onExpand(bool notExpanded) {
    if (notExpanded) {
      setState(() {
        animatedScale = 1.0;
      });
    }else{
      setState(() {
        animatedScale = 1.5;
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    final String num = x.toString();
    final String num2 = (x/3).floor().toString();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Item #${widget.model.index}'),
        actions: const [
          // Icon(Icons.arrow_back_ios_outlined),
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(Icons.favorite_border),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Card(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  child: Hero(
                    tag: widget.model.index,
                    child: AnimatedContainer(
                      duration: animationDuration,
                      height: _height,
                      width: _width,
                      child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(15)),
                          child: Image.asset('assets/images/${widget.model.index[0]}.png',fit: BoxFit.fill,)),
                    ),
                  ),
                ),
              ),
              Center(
                child: AnimatedScale(
                  duration: animationDuration,
                  scale: animatedScale,
                  child: Text(artist,
                      style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center),
                ),
              ),
              SizedBox(height: SizeConfig.blockSizeVertical*2,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(num,style: Theme.of(context).textTheme.headline6?.copyWith(fontWeight: FontWeight.bold)),
                      Text(quantity,style: Theme.of(context).textTheme.subtitle1),
                    ],
                  ),
                  Column(
                    children: [
                      Text(num2,style: Theme.of(context).textTheme.headline6),
                      Text(owners,style: Theme.of(context).textTheme.subtitle1),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            height: 24,
                            width: 24,
                            child: SvgPicture.asset(xrpIcon,color: Colors.black,),),
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Text(y.toString(),style: Theme.of(context).textTheme.headline6),
                          ),
                        ],
                      ),
                      Text(price,style: Theme.of(context).textTheme.subtitle1),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: ReadMoreText(description,
                  trimCollapsedText: 'more',
                  trimExpandedText: 'less',
                  colorClickableText: Colors.blueAccent,
                  callback: (bool val){
                    onExpand(val);
                  },
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.justify,),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text('More in ${locations[int.parse(widget.model.index[0])]}', style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),),
              ),
              SizedBox(
                height: SizeConfig.screenHeight*.15,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index){
                      return NFTCollectionAvatar(index: index.toString());
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}