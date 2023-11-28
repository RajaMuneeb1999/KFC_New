import 'dart:ffi';

import 'package:flutter/cupertino.dart';

import 'package:pushnoti_two/model/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> saveUser(LogInModel user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt('branchRiderID', user.branchRiderID!);
    sp.setString('firstName', user.firstName!);
    notifyListeners();
    return true;

    /*https://hds.kfcpakistan.com/riderappservice/RiderAppService/riderLogin?ApiUserName=riderappuser&ApiPassword=nSFn%40xxfwxM%3Fz%5B%3D5pbt%25Zu%2FT%25%5E.m%2B%21Zp%7B&UserName=muneeb.1&Password=123&imei=&token=fhZXJjrj03o%3AAPA91bH5dzrOPNHMAI82p5_kt_lgRhlzIfJ1ytqvDIc53b8yuvsiozL9YaPirpuYgZn9RFMGKD7JYPIQ7FzwcnsfxYpOUVYep-3R3RJ0ruDmtsYNO_oYswM7QV3GPxYz4hnyuv9_LGy7*/
  }

  Future<LogInModel> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final int? branchRiderID_ = sp.getInt('branchRiderID');
    final String? firstName_ = sp.getString('firstName');

    return LogInModel(
      branchRiderID: branchRiderID_,
      firstName: firstName_
    );
  }

  Future<int?> getBranchRiderID() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final int? branchID_ = sp.getInt('branchRiderID');

    return branchID_;
  }

  Future<bool> remove() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('branchRiderID');
    return true;
  }
}
