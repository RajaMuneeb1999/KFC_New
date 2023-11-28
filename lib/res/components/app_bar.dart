import 'package:flutter/material.dart';
import 'package:pushnoti_two/res/color.dart';

import '../texts.dart';

AppBar myAppBar() {
  return AppBar(
    elevation: 0,
    title: Text(Texts.kfcRider),
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: <Color>[AppColors.mainColor, AppColors.mainColorDark],
        ),
        // image: DecorationImage(
        //   image: AssetImage("assets/drawable-xhdpi/header_bar.png"),
        //   fit: BoxFit.cover,
        // ),
      ),
    ),
    // backgroundColor: Colors.transparent,
  );
}
