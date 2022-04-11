import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../screens/market/market_web.dart';

/// Sliver Grid View for all trips
class SliverGridView extends StatelessWidget {
  final String tag;
  final int plus;

  const SliverGridView({Key? key, required this.tag, required this.plus}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      StaggeredGrid.count(
        crossAxisCount: 3,
        mainAxisSpacing: 3,
        crossAxisSpacing: 3,
        children: List.generate(3, (index) => NFTCollection(index: '${index+plus} $tag')),
      );
  }
}