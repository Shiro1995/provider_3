import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Color kColorGrayText = Color.fromRGBO(132, 132, 132, 1.0);

class DeckScreen extends StatelessWidget {
  @override
  String get screenName => 'Deck';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //   appBar: AppBar(
        //     title: Text(
        //       'Symptom',
        //     ),
        //   ),
        body: CustomScrollView(
      slivers: <Widget>[
        const SliverAppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          pinned: false,
          expandedHeight: 150.0,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              'Cac trieu chung cua tre',
              style: TextStyle(
                fontSize: 16.0,
                color: kColorGrayText,
              ),
            ),
          ),
        ),
        SliverGrid(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 4.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: Text('Grid Item $index'),
              );
            },
            childCount: 10,
          ),
        ),
        SliverFixedExtentList(
          itemExtent: 50.0,
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text('List Item $index'),
              );
            },
          ),
        ),
      ],
    ));
  }
}
