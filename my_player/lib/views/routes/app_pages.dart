import 'package:get/get.dart';
import 'package:my_player/views/screens/authetication/signup_screen.dart';
import 'package:my_player/views/screens/on_boarding_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.onBoardingScreen,
      page: () => const OnBoardingScreen(),
    ),
    GetPage(
      name: AppRoutes.signupScreen,
      page: () => const SignupScreen(),
    ),
  ];
}
