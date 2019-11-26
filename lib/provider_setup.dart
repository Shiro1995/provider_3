import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'core/services/Auth.dart';
// import 'core/models/user.dart';

List<SingleChildCloneableWidget> providers = [
  
];

List<SingleChildCloneableWidget> independentServices = [
  Provider.value(value: Auth())
];

List<SingleChildCloneableWidget> dependentServices = [
  StreamProvider<FirebaseUser>.value(
	  
  )
];

// List<SingleChildCloneableWidget> uiConsumableProviders = [
//   StreamProvider<User>(
//     builder: (context) => Provider.of<Auth>(context, listen: false).user,
//   )
// ];
