import 'package:flutter/material.dart';
import 'package:myapp/Util/router.dart';
import 'package:myapp/screen/auth/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FlutterLogo(),
      ),
    );
  }

  void navigate() {
    Future.delayed(Duration(seconds: 3), () {
      PageNavigator(ctx: context).nextPage(page: LoginPage());
    });
  }
}
