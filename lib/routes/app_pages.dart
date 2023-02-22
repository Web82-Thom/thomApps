import 'package:get/get.dart';
import 'package:thomapps/screens/auths/views/auth_view.dart';
import 'package:thomapps/screens/auths/widgets/signin_widget.dart';
import 'package:thomapps/screens/auths/widgets/signup_widget.dart';
import 'package:thomapps/screens/home/views/home_view.dart';
import 'package:thomapps/screens/profile/views/profile_view.dart';
import 'package:thomapps/screens/home/views/contact_view.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.WELCOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      // binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => AuthView(),
      // binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => SignupWidget(),
      // binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => SigninWidget(),
      // binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      // binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.CONTACT,
      page: () => ContactView(),
      // binding: AuthBinding(),
    ),
    
  ];
}
