import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../model/login_model.dart';
import '../../utils/routes/routes_name.dart';
import '../../view_model/login_view_model.dart';
import '../../view_model/user_view_model.dart';
import '../../view_model/user_view_model.dart';
import '../../view_model/user_view_model.dart';
import '../app_url.dart';
import '../texts.dart';

class KfcDrawer extends StatefulWidget {
  const KfcDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<KfcDrawer> createState() => _KfcDrawerState();
}

class _KfcDrawerState extends State<KfcDrawer> {
  LogInModel model = LogInModel();
  String? firstName_ = "";

  @override
  void initState() {
    // TODO: implement initState
    setName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.red, Colors.redAccent],
                  end: Alignment.centerLeft,
                  begin: Alignment.centerRight),
              borderRadius: BorderRadius.all(
                Radius.circular(11),
              ),
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                "assets/drawable-xxhdpi/rsz_user.png",
                height: 185.0,
                width: 195.0,
              ),
              const SizedBox(
                width: 16.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    {Texts.welcome, firstName_} as String,
                    style: const TextStyle(
                        fontSize: 18.0, fontFamily: "Brand Bold"),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                ],
              ),
            ]),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            // leading: CircleAvatar(
            //   backgroundColor: Colors.transparent,
            //   child: Image.asset('assets/Icons-icon-home.png'),
            // ),
            title: Text(Texts.home,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  color: Color(0xff1A237E),
                )),
            onTap: () {
              Navigator.pushNamed(context, RoutesName.home);
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            // leading: CircleAvatar(
            //   backgroundColor: Colors.transparent,
            //   child: Image.asset('assets/Icons-icon-home.png'),
            // ),
            title: Text(Texts.profile,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  color: Color(0xff1A237E),
                )),
            onTap: () {
              Navigator.pushNamed(context, RoutesName.home);
            },
          ),
          ListTile(
            leading: Image.asset("assets/26/KPI.png"),
            // leading: CircleAvatar(
            //   backgroundColor: Colors.transparent,
            //   child: Image.asset('assets/Icons-icon-home.png'),
            // ),
            title: Text(Texts.mykpi,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  color: Color(0xff1A237E),
                )),
            onTap: () {
              Navigator.pushNamed(context, RoutesName.home);
            },
          ),
          ListTile(
            leading: Image.asset("assets/26/roter.png"),
            // leading: CircleAvatar(
            //   backgroundColor: Colors.transparent,
            //   child: Image.asset('assets/Icons-icon-home.png'),
            // ),
            title: Text(Texts.muRoster,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  color: Color(0xff1A237E),
                )),
            onTap: () {
              Navigator.pushNamed(context, RoutesName.home);
            },
          ),
          ListTile(
            leading: Image.asset("assets/26/wallet.png"),
            // leading: CircleAvatar(
            //   backgroundColor: Colors.transparent,
            //   child: Image.asset('assets/Icons-icon-home.png'),
            // ),
            title: Text(Texts.myWallet,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  color: Color(0xff1A237E),
                )),
            onTap: () {
              Navigator.pushNamed(context, RoutesName.home);
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            // leading: CircleAvatar(
            //   backgroundColor: Colors.transparent,
            //   child: Image.asset('assets/Icons-icon-home.png'),
            // ),
            title: Text(Texts.myHistory,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  color: Color(0xff1A237E),
                )),
            onTap: () {
              Navigator.pushNamed(context, RoutesName.home);
            },
          ),
          ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Icon(
                Icons.logout,
                color: Colors.black54,
              ),
            ),
            title: Text(Texts.logout,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  color: Color(0xff1A237E),
                )),
            onTap: () async {
              LogoutCall();
            },
          ),
        ],
      ),
    );
  }

  Future<void> setName() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();

    setState(() {
      firstName_ = sp.getString('firstName');
    });
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
}
