import 'package:final_1/core/services/api.dart';
import 'package:final_1/ui/widgets/conference_speaker.dart';
import 'package:flutter/material.dart';

class FourthTab extends StatefulWidget {
  final ConferenceSpeaker conferenceSpeaker;
  FourthTab({this.conferenceSpeaker});

  @override
  _FourthTabState createState() => _FourthTabState();
}

class _FourthTabState extends State<FourthTab> {
  Api _api;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // _api.fetchPost();
    return GestureDetector(
      child: Card(
        color: Colors.green,
        child: Container(
          child: GridTile(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                GridTileBar(
                    title: Text(
                  '',
                  style: Theme.of(context).textTheme.title,
                  maxLines: 4,
                )),
                OrientationBuilder(
                    builder: (BuildContext context, Orientation orientation) {
                  return SizedBox(
                    width: orientation == Orientation.portrait ? 100.0 : 150.0,
                    height: orientation == Orientation.portrait ? 100.0 : 150.0,
                    // child: Hero(
                    //     tag: conferenceSpeaker,
                    //     child: AvatarFadeImage('images/babysick.jpg')),
                  );
                }),
                GridTileBar(
                  title: Chip(
                      backgroundColor: Colors.blue, label: Text('Profile')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
