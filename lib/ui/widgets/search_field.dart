import 'package:flutter/material.dart';

typedef SearchCallback = void Function(String text);

class SearchField extends StatelessWidget {
  SearchField({
    Key key,
    this.onChanged,
	this.controller,
    // this.onSubmitted,
  }) ;
//   : assert(onSubmitted != null);

  final SearchCallback onChanged;
  final TextEditingController controller;
//   final VoidCallback onSubmitted;

  Widget _icon() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: Icon(
          Icons.search,
        ),
      ),
    );
  }

  InputBorder _border() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.transparent),
    );
  }

  Widget _textField() {
    return Expanded(
      child: Container(
        child: Padding(
          padding: EdgeInsets.only(top: 15.0),
          child: TextField(
			  controller: controller,
            style: TextStyle(color: Colors.black),
            autofocus: false,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.search,
            autocorrect: false,
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.black),
              hintText: 'Search Disease',
              border: _border(),
              focusedBorder: _border(),
              disabledBorder: _border(),
              enabledBorder: _border(),
            ),
            onChanged: (String text) {
              onChanged(text);
            },
            // onSubmitted: (String text) {
            //   onSubmitted();
            // },
          ),
        ),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 2.5,
      ),
      child: Container(
		  width: double.infinity,
		  height: 40,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _icon(),
            _textField(),
          ],
        ),
      ),
    );
  }
}
