import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../res/app_url.dart';
import '../view_model/login_view_model.dart';
import '../view_model/user_view_model.dart';

class LogoutFragment extends StatefulWidget {
  const LogoutFragment({super.key});

  @override
  State<LogoutFragment> createState() => _LogoutFragmentState();
}

class _LogoutFragmentState extends State<LogoutFragment> {
  @override
  void initState() {
    LogoutCall();
    super.initState();
  }

  Future<void> LogoutCall() async {
    final authViewMode = Provider.of<LoginViewModel>(context);
    int branchRiderId = 0;
    await UserViewModel()
        .getBranchRiderID()
        .then((value) => branchRiderId = value!);
    // Navigator.pushNamed(context, RoutesName.splash);
    final uri = Uri.parse(AppUrl.logoutEndPint).replace(queryParameters: {
      "ApiUserName": "riderappuser",
      "ApiPassword": "nSFn@xxfwxM?z[=5pbt%Zu/T%^.m+!Zp{",
      "RiderID": branchRiderId.toString(),
      "imei": "",
    });
    authViewMode.loginOut(uri, context);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Center(
      child: Scaffold(body: Text('Logout')),
    );
  }
}
