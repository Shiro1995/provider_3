import 'package:flutter/material.dart';

class FirstTab extends StatefulWidget {
  @override
  _FirstTabState createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int position) {
          return Card(
              color: Colors.amberAccent,
              elevation: 2.0,
              child: ListTile(
                leading: Icon(Icons.adjust),
                title: Text('chao ban'),
                subtitle: Text('56'),
                trailing: Checkbox(
                  onChanged: (bool newhic) {

                  },
                   value: false,
                ),
              ));
        });
  }
}
