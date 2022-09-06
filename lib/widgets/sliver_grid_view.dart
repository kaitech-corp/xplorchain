import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../screens/market/market_web.dart';

/// Sliver Grid View for all trips
class SliverGridView extends StatelessWidget {

  const SliverGridView({ required this.tag, required this.plus, Key? key}) : super(key: key);
  final String tag;
  final int plus;

  @override
  Widget build(BuildContext context) {
    return
      StaggeredGrid.count(
        crossAxisCount: 3,
        mainAxisSpacing: 3,
        crossAxisSpacing: 3,
        children: List.generate(3, (int index) => NFTCollection(index: '${index+plus} $tag')),
      );
  }
}