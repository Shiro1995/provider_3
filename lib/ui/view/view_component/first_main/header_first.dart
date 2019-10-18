import 'package:final_1/core/constant/app_constant.dart';
import 'package:final_1/ui/view/view_component/first_main/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Color kColorGrayText = Color.fromRGBO(132, 132, 132, 1.0);
const double kSmallPadding = 7.0;
const double kPadding = 12.0;
final TextStyle _kTextStyle = TextStyle(
  fontSize: 14.0,
  color: kColorGrayText,
);
final TextStyle _textStyleName = TextStyle(
    fontSize: 16.0,
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );
const String text1 = 'Trẻ ho hoặc khó thở';
const String text2 = 'Ho khò khè, thở nhanh, khó thở';
const String text3 = 'Thở rít nằm nghiên';
const String text4 = 'tiêu chảy';
class DeckScreen extends StatelessWidget {
  @override
  String get screenName => 'Deck';

  Widget _sectionList(String string) {
    return Container(
      height: 35,
      color: Colors.green[400],
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            string,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  _headerlist() {
    return Container(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: new BorderRadius.circular(12.0),
            child: Image.asset(
              "images/babysick.jpg",
              height: 100,
            ),
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(kPadding),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Dấu hiệu ở trẻ em',
                        maxLines: 3,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\nCác triệu chứng xuất hiện từ 5 tháng tuổi đến 5 tuối',
                        textAlign: TextAlign.center,
                        style: _kTextStyle,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionHeader() {
    return SliverPersistentHeader(
      pinned: false,
      floating: false,
      delegate:
          DeckHeader(minHeight: 60.0, maxHeight: 200.0, child: _headerlist()),
    );
  }

  Widget _widgetLeft() {
    return Container(
      width: 55.0,
      child: Center(
        child: Icon(Icons.open_with)
      ),
    );
  }
  Widget _widgetMiddle(String text) {
   
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FittedBox(
            child: Text(
              text,
              style: _textStyleName,
            ),
          ),
        //   FittedBox(
        //     child: Text(
        //       subtitle,
        //       style: kTextStyleType,
        //     ),
        //   ),
        ],
      ),
    );
  }

  Widget cardList(BuildContext context, int index, String text) {
    return Column(
      children: <Widget>[
        Container(
          height: 55.0,
          child: RawMaterialButton(
            onPressed: null,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _widgetLeft(),
				_widgetMiddle(text),
              ],
            ),
          ),
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 20, 175, 135),
          title: Text(
            'Symptom',
          ),
        ),
        body: CustomScrollView(
          slivers: <Widget>[
            _sectionHeader(),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  if (index == 0) {
                    return _sectionList(text1);
                  } else {
                    return cardList(context, 3, text2);
				
                  }
                },
                childCount: 5,
              ),
            ),
			 SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  if (index == 0) {
                    return _sectionList(text4);
                  } else {
                    return cardList(context, 2, text3);
				
                  }
                },
                childCount: 5,
              ),
            ),
			 SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  if (index == 0) {
                    return _sectionList('Trẻ bị sốt');
                  } else {
                    return cardList(context, 2, 'Sởi và các triệu chứng');
				
                  }
                },
                childCount: 5,
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 50.0,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  if (index < 15)
                    return Container(
                      alignment: Alignment.center,
                      color: Colors.white,
                      child: Text('List Item $index'),
                    );
                  return null;
                },
              ),
            ),
			
            // SliverGrid(
            //   gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            //     maxCrossAxisExtent: 200.0,
            //     mainAxisSpacing: 10.0,
            //     crossAxisSpacing: 10.0,
            //     childAspectRatio: 4.0,
            //   ),
            //   delegate: SliverChildBuilderDelegate(
            //     (BuildContext context, int index) {
            //       return Container(
            //         alignment: Alignment.center,
            //         color: Colors.teal[100 * (index % 9)],
            //         child: Text('Grid Item $index'),
            //       );
            //     },
            //     childCount: 10,
            //   ),
            // ),
          ],
        ));
  }
}
