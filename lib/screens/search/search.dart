import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


///NFT Search Page
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
              child: Text(Intl.message('Search Page'))
            ),
          ],
      ),
    );
  }

}

