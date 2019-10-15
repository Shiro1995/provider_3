import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeckHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
		  return Container(
			  child: Text('hi'),
		  );
	  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 160;

  @override
  // TODO: implement minExtent
  double get minExtent => 160;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return false;
  }
}
