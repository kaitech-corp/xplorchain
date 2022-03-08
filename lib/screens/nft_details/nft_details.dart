import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readmore/readmore.dart';
import 'package:travel_chain_mvp/models/nft_details.dart';
import 'package:travel_chain_mvp/screens/market/market_screen.dart';
import 'package:travel_chain_mvp/services/constants/constants.dart';
import 'package:travel_chain_mvp/services/constants/functions.dart';
import 'package:travel_chain_mvp/services/size_config/size_config.dart';

class NFTDetails extends StatefulWidget {

  final NFTDetailsModel model;

  const NFTDetails({Key? key, required this.model}) : super(key: key);

  @override
  State<NFTDetails> createState() => _NFTDetailsState();
}

class _NFTDetailsState extends State<NFTDetails> {

  var _height = SizeConfig.screenHeight*.35;
  var _width = SizeConfig.screenWidth*.75;
  var x = randomNumber();
  var y = randomNumber();
  double animatedScale = 1.0;

  bool expanded = false;


  void onExpand(bool notExpanded) {
    // if(mounted){
      if (notExpanded) {
        setState(() {
          _height = SizeConfig.screenHeight * .35;
          _width = SizeConfig.screenWidth*.75;
          animatedScale = 1.0;
        });
      }else{
        setState(() {
          _height = SizeConfig.screenHeight * .07;
          _width = SizeConfig.screenWidth*.15;
          animatedScale = 1.5;
        });
      }

    // }
  }



  @override
  Widget build(BuildContext context) {
    var num = x.toString();
    var num2 = (x/3).floor().toString();

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
                  trimLines: 2,
                  trimCollapsedText: 'more',
                  trimExpandedText: 'less',
                  trimMode: TrimMode.Length,
                  colorClickableText: Colors.blueAccent,
                  callback: (val){
                    onExpand(val);
                  },
                  style: Theme.of(context).textTheme.headline6,
                  textAlign: TextAlign.justify,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("More in ${locations[int.parse(widget.model.index[0])]}", style: Theme.of(context).textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),),
              ),
              SizedBox(
                height: SizeConfig.screenHeight*.15,
                width: double.infinity,
                child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index){
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