import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rydr/core/bloc/authentication/bloc/auth_bloc_bloc.dart';
import 'package:rydr/views/Authentication/choose_auth.dart';
import 'package:rydr/views/Onboarding/onboarding.dart';
import 'package:rydr/views/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

int? isviewed;

 main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late AuthBlocBloc bloc;

  @override
  void initState() {
    bloc = AuthBlocBloc();
    bloc.add(LoginCurrentUser());
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Rydr Hailing Application',
        debugShowCheckedModeBanner: false,
        home: SplashScreen());
  }
}
