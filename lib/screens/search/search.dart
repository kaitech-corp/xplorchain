import 'package:flutter/material.dart';


///NFT Search Page
class Search extends StatelessWidget{
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Search Page")
            ),
          ],
      ),
    );
  }

}

