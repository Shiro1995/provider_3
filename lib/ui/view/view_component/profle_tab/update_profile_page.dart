import 'package:flutter/material.dart';

class UpdateProfilePage extends StatelessWidget {
	 final myController = TextEditingController(text: 'BK Lap');
	 	 final myController2 = TextEditingController(text: 'tnt.giuma@gmail.com');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
		  backgroundColor: Color.fromARGB(255, 20, 175, 135),
	  ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildUserInfo,
            _buildUpdatingInfo(context),
          ],
        ),
      ),
    );
  }

  get _buildUserInfo {
    return Container(
      padding: EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildAvatar(),
          SizedBox(width: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Dinh Hai',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.pinkAccent,
                ),
              ),
              Row(children: <Widget>[Icon(Icons.phone), Text('0923423141')]),
              Row(children: <Widget>[
                Icon(Icons.email),
                Text('lapzoma1234@gmail.com')
              ])
              // TextWithIcon(icon: Icons.phone, textContent: '093 572 8387'),
              // TextWithIcon(
              //     icon: Icons.mail_outline,
              //     textContent: 'lekychucds@gmail.com'),
            ],
          )
        ],
      ),
    );
  }

  _buildAvatar() {
    return Stack(
      children: <Widget>[
        Container(
          width: 90,
          height: 90,
          child:
              CircleAvatar(backgroundImage: AssetImage('images/babysick.jpg')),
        ),
        Positioned(
          bottom: 5,
          left: 35,
          child: Icon(
            Icons.photo_camera,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  _buildUpdatingInfo(context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50, horizontal: 27),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Basic information',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 10),
          _buildUpdatingBox(context),
        ],
      ),
    );
  }

  _buildUpdatingBox(context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: (20),
        vertical: (12),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'User name',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 10),
          Container(
            height: 40,
            child: TextField(
				controller: myController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(10),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Email',
            style: TextStyle(fontSize: 14, color: Colors.blueGrey),
          ),
          SizedBox(height: 10),
          Container(
            height: (40),
            child: TextField(
				controller: myController2,
              style: TextStyle(color: Colors.blueGrey),
              cursorColor: Colors.blueGrey,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                contentPadding: EdgeInsets.all(10),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blueGrey),
                ),
              ),
            ),
          ),
          SizedBox(height: (30)),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              alignment: Alignment.centerRight,
              width: (120),
              child: RaisedButton(
                color: Colors.green,
                onPressed: () {},
                child: Text(
                  'Update',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
