import 'package:go_router/go_router.dart';
import 'package:quotes_clean/main.dart';


class RouterConst {
  static String homescreen = "homescreen";
  static String favscreen = "favscreen";
  static String cartscreen = "cartscreen";
  static String forgetScreen = "forgetscreen";
  static String signInScreen = "signInScreen";
  static String signUpScreen = "signUpScreen";
  static String splashScreen = "splashScreen";
  static String switchScreen = "switchScreen";
}

GoRouter router = GoRouter(routes: [
  GoRoute(
      path: "/",
      builder: (context, state) => const MyHomePage(title: "Quotes"),
      routes: const []),
]);
