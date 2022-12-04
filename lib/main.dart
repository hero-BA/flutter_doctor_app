import 'package:flutter/material.dart';
import 'package:flutter_doctor_app/features/auth/screens/login_screen.dart';
import 'package:flutter_doctor_app/providers/user_provider.dart';
import 'package:flutter_doctor_app/router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doctor App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const LoginScreen(),
    );
  }
}
