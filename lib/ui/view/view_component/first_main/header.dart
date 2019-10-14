
import 'package:flutter/cupertino.dart';

class DeckHeader extends StatelessWidget {
//   DeckHeader({
//     Key key,
//     @required this.viewModel,
//   }) : assert(viewModel != null);

//   final DeckHeaderViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: false,
      floating: false,
      delegate: _DeckHeaderDelegate(),
    );
  }
}
class _DeckHeaderDelegate extends SliverPersistentHeaderDelegate {


  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
   return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
			Text('hello '),
        //   _icon(),
        //   SizedBox(height: 5),
        //   _name(),
        //   SizedBox(height: 5),
        //   _faction(),
        //   SizedBox(height: 5),
        //   _info(),
        ],
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => null;

  @override
  // TODO: implement minExtent
  double get minExtent => null;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return null;
  }

}