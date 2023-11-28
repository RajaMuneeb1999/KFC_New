import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pushnoti_two/model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';
import '../services/splash_services.dart';
import '../utils/routes/routes_name.dart';
import '../view_model/user_view_model.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();

  @override
  void initState() {
    super.initState();
    splashServices.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/drawable-xxhdpi/splash_screen.png",
            ),
          ),
        ),
      ),
    );
  }
}
