import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:thomapps/screens/auths/controllers/auth_controllers.dart';
import 'package:thomapps/screens/auths/widgets/signin_widget.dart';
import 'package:thomapps/screens/auths/widgets/signup_widget.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}
AuthController authController = AuthController();
class _AuthViewState extends State<AuthView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
          body: (authController.isSignUp) ? SignupWidget() : SigninWidget(),
      ),
        );
  }
}