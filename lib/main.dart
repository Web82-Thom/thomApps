import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:thomapps/screens/auths/views/auth_view.dart';
import 'package:thomapps/screens/auths/widgets/signin_widget.dart';
import 'package:thomapps/screens/auths/widgets/signup_widget.dart';
import 'package:thomapps/screens/home/views/home_view.dart';
import 'package:thomapps/widgets_accessories/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:thomapps/routes/app_pages.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'FlutterChat',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          buttonTheme: ButtonTheme.of(context).copyWith(
            buttonColor: Colors.pink,
            textTheme: ButtonTextTheme.primary,
            shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
        ),
      getPages: AppPages.routes,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fr', 'FR'), // Français, no country code
      ],
      debugShowCheckedModeBanner: false,

      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, userSnapshot) {
          if (userSnapshot.connectionState == ConnectionState.waiting) {
            return SplashScreen();
          }
          if (userSnapshot.hasData) {
            return HomeView();
          }
          return const AuthView();
        },
      ),
      routes: {
        "/home": (context) => HomeView(),
        "/auth": (context) => const AuthView(),
        "/signin": (context) =>  SigninWidget(),
        "/signup": (context) =>  SignupWidget(),
        // "/signUp" : (context) => SignupWidget(),
      },
    );
  }
}