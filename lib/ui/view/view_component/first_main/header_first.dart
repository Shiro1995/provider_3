import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'header.dart';

class DeckScreen extends StatelessWidget {
  Widget _header(BuildContext context) {
    return DeckHeader();
  }
  @override
  String get screenName => 'Deck';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Deck',
          //   key: Keys.deckTitle,
        ),
      ),
      body: CustomScrollView(
        // key: Keys.deckList,
        slivers: <Widget>[
        //   _header(context),
          Text('hello')
          //   _sectionList(type: CardType.agenda),
          //   _sectionList(type: CardType.plot),
          //   _sectionList(type: CardType.character),
          //   _sectionList(type: CardType.attachment),
          //   _sectionList(type: CardType.location),
          //   _sectionList(type: CardType.event),
          //if (viewModel.description() != null) _description(),
        ],
      ),
    );
  }
}
