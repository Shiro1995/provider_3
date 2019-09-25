import 'package:final_1/core/constant/app_constant.dart';
import "package:flutter/material.dart";
import "package:final_1/ui/widgets/custom_text_field.dart";
import 'package:flutter/services.dart';
import 'package:final_1/ui/widgets/custom_flat_button.dart';
import 'package:final_1/ui/widgets/custom_alert_dialog.dart';

class SignInScreen extends StatefulWidget {
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _email = new TextEditingController();
  final TextEditingController _password = new TextEditingController();
  CustomTextField _emailField;
  CustomTextField _passwordField;
  bool _blackVisible = false;
  VoidCallback onBackPress;

  @override
  void initState() {
    super.initState();

    onBackPress = () {
      Navigator.of(context).pop();
    };

    _emailField = new CustomTextField(
      baseColor: Colors.grey,
      borderColor: Colors.grey[400],
      errorColor: Colors.red,
      controller: _email,
      hint: "E-mail Adress",
      inputType: TextInputType.emailAddress,
      //   validator: Validator.validateEmail,
    );
    _passwordField = CustomTextField(
      baseColor: Colors.grey,
      borderColor: Colors.grey[400],
      errorColor: Colors.red,
      controller: _password,
      obscureText: true,
      hint: "Password",
      //   validator: Validator.validatePassword,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPress,
      child: Scaffold(
		  backgroundColor: Color.fromARGB(255, 20, 200, 150),
        body: Stack(
          children: <Widget>[
            Stack(
              alignment: Alignment.topLeft,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 200, left: 30, right: 30),
                  height: 350,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0.0, 15.0),
                          blurRadius: 15.0,
                        ),
                      ]),
                ),
                ListView(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 60.0),
                      child: Container(
                          height: 100,
                          child: Image.asset('images/medicine.png')),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        'Personal \nHealthcare',
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 20.0, bottom: 10.0, left: 80.0, right: 50.0),
                      child: _emailField,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 10.0, bottom: 20.0, left: 80.0, right: 50.0),
                      child: _passwordField,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 14.0, horizontal: 60.0),
                      child: CustomFlatButton(
                        title: "Log In",
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        textColor: Colors.white,
                        onPressed: () {
							 Navigator.of(context).pushNamed(RoutePaths.Welcome);
                        //   _emailLogin(
                        //       email: _email.text,
                        //       password: _password.text,
                        //       context: context);
                        },
                        splashColor: Colors.black12,
                        borderColor: Color.fromRGBO(17, 156, 103, 30),
                        borderWidth: 0,
                        color: Color.fromRGBO(17, 156, 103, 1),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(10.0),
                    //   child: Text(
                    //     "OR",
                    //     softWrap: true,
                    //     textAlign: TextAlign.center,
                    //     style: TextStyle(
                    //       color: Colors.black,
                    //       decoration: TextDecoration.none,
                    //       fontSize: 15.0,
                    //       fontWeight: FontWeight.w300,
                    //       fontFamily: "OpenSans",
                    //     ),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(
                    //       vertical: 14.0, horizontal: 40.0),
                    //   child: CustomFlatButton(
                    //     title: "Facebook Login",
                    //     fontSize: 22,
                    //     fontWeight: FontWeight.w700,
                    //     textColor: Colors.white,
                    //     onPressed: () {
                    //     //   _facebookLogin(context: context);
                    //     },
                    //     splashColor: Colors.black12,
                    //     borderColor: Color.fromRGBO(59, 89, 152, 1.0),
                    //     borderWidth: 0,
                    //     color: Color.fromRGBO(59, 89, 152, 1.0),
                    //   ),
                    // ),
                  ],
                ),
                SafeArea(
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: onBackPress,
                  ),
                ),
              ],
            ),
            Offstage(
              offstage: !_blackVisible,
              child: GestureDetector(
                onTap: () {},
                child: AnimatedOpacity(
                  opacity: _blackVisible ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 400),
                  curve: Curves.ease,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _changeBlackVisible() {
    setState(() {
      _blackVisible = !_blackVisible;
    });
  }

  void _emailLogin(
      {String email, String password, BuildContext context}) async {
    // if (Validator.validateEmail(email) &&
    //     Validator.validatePassword(password)) {
    //   try {
    //     SystemChannels.textInput.invokeMethod('TextInput.hide');
    //     _changeBlackVisible();
    //     await Auth.signIn(email, password)
    //         .then((uid) => Navigator.of(context).pop());
    //   } catch (e) {
    //     print("Error in email sign in: $e");
    //     String exception = Auth.getExceptionText(e);
    //     _showErrorAlert(
    //       title: "Login failed",
    //       content: exception,
    //       onPressed: _changeBlackVisible,
    //     );
    //   }
    // }
  }

//   void _facebookLogin({BuildContext context}) async {
//     try {
//       SystemChannels.textInput.invokeMethod('TextInput.hide');
//       _changeBlackVisible();
//       FacebookLogin facebookLogin = new FacebookLogin();
//       FacebookLoginResult result = await facebookLogin
//           .logInWithReadPermissions(['email', 'public_profile']);
//       switch (result.status) {
//         case FacebookLoginStatus.loggedIn:
//           Auth.signInWithFacebok(result.accessToken.token).then((uid) {
//             Auth.getCurrentFirebaseUser().then((firebaseUser) {
//               User user = new User(
//                 firstName: firebaseUser.displayName,
//                 userID: firebaseUser.uid,
//                 email: firebaseUser.email ?? '',
//                 profilePictureURL: firebaseUser.photoUrl ?? '',
//               );
//               Auth.addUser(user);
//               Navigator.of(context).pop();
//             });
//           });
//           break;
//         case FacebookLoginStatus.cancelledByUser:
//         case FacebookLoginStatus.error:
//           _changeBlackVisible();
//       }
//     } catch (e) {
//       print("Error in facebook sign in: $e");
//       String exception = Auth.getExceptionText(e);
//       _showErrorAlert(
//         title: "Login failed",
//         content: exception,
//         onPressed: _changeBlackVisible,
//       );
//     }
//   }

  void _showErrorAlert({String title, String content, VoidCallback onPressed}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return CustomAlertDialog(
          content: content,
          title: title,
          onPressed: onPressed,
        );
      },
    );
  }
}
