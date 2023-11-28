
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pushnoti_two/model/login_model.dart';

import '../utils/routes/routes_name.dart';
import '../view_model/user_view_model.dart';


class SplashServices {


  Future<LogInModel> getUserDate() => UserViewModel().getUser();


  void checkAuthentication(BuildContext context)async{

    getUserDate().then((value)async{

      print(value.branchRiderID.toString());

      if(value.branchRiderID == null || value.branchRiderID == 0){
        await Future.delayed(const Duration(seconds: 1));
        Navigator.pushNamed(context, RoutesName.login);
      }else {
        await  Future.delayed(const Duration(seconds: 1));
        Navigator.pushNamed(context, RoutesName.home);
      }

    }).onError((error, stackTrace){
      if(kDebugMode){
        print(error.toString());
      }
    });

  }



}