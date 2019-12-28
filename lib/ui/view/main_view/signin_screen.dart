import 'package:final_1/core/constant/app_constant.dart';
import "package:flutter/material.dart";
import "package:final_1/ui/widgets/custom_text_field.dart";
import 'package:flutter/services.dart';
import 'package:final_1/ui/widgets/custom_flat_button.dart';


class SignInScreen extends StatefulWidget {
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController _email = new TextEditingController();
  final TextEditingController _password = new TextEditingController();
  CustomTextField _emailField;
  CustomTextField _passwordField;

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
         backgroundColor: Colors.red[300],
        body: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 200, left: 30, right: 30),
              height: 410,
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
                      height: 100, child: Image.asset('images/medicine.png')),
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
                    },
                    splashColor: Colors.black12,
                    borderColor: Color.fromRGBO(17, 156, 103, 30),
                    borderWidth: 0,
                    color: Color.fromARGB(255, 20, 175, 135),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 14.0, horizontal: 60.0),
                  child: CustomFlatButton(
                    title: "Back",
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
                    color: Colors.orangeAccent,
                  ),
                ),
              ],
            ),
           
          ],
        ),
      ),
    );
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

}
