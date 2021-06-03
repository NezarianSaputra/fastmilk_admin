import 'package:fastmilk_admin/routes.dart';
import 'package:fastmilk_admin/screen/homepage/component/body_homepage.dart';
import 'package:fastmilk_admin/screen/homepage/home_page.dart';
import 'package:fastmilk_admin/screen/landing_screen/landing_screen.dart';
import 'package:fastmilk_admin/screen/login/login.dart';
import 'package:fastmilk_admin/services/auth_login.dart';
import 'package:fastmilk_admin/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen/splashscreen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthServices>(
          create: (_) => AuthServices(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthServices>().firebaseUserStream,
        )
      ],
      child: MaterialApp(
        theme: theme(),
        debugShowCheckedModeBanner: false,
        home: AuthWrapper(),
        // initialRoute: SplashScreen.routeName,
        routes: routes,
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = Provider.of<User>(context);
    return (firebaseUser == null) ? Login() : SplashScreen();
  }
}
