import 'package:flutter/material.dart';
import 'package:myapp/Provider/authprovider/auth_provider.dart';
import 'package:myapp/splash.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>Authentication(),),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          appBarTheme: AppBarTheme(color: Color.fromARGB(255, 179, 70, 189)),
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
