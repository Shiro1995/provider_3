import 'package:provider/provider.dart';
import 'core/services/api.dart';
import 'core/services/Auth.dart';
import 'core/model/user.dart';
// import 'core/models/user.dart';

List<SingleChildCloneableWidget> providers = [
  ...independentServices,
//    ...dependentServices,
  ...uiConsumableProviders
];

List<SingleChildCloneableWidget> independentServices = [
  Provider.value(value: Auth())
];

// List<SingleChildCloneableWidget> dependentServices = [
//   ProxyProvider< Auth>( builder: (context,authenticationService) =>
//         Auth(),
//   )
// ];

List<SingleChildCloneableWidget> uiConsumableProviders = [
  StreamProvider<User>(
    builder: (context) => Provider.of<Auth>(context, listen: false).user,
  )
];
