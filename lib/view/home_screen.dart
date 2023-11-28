import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:pushnoti_two/fragments/logout_fragment.dart';
import 'package:pushnoti_two/fragments/myhistory_fragment.dart';
import 'package:pushnoti_two/fragments/mykpi_fragment.dart';
import 'package:pushnoti_two/fragments/myroaster_fragment.dart';
import 'package:pushnoti_two/fragments/mywallet_fragment.dart';
import 'package:pushnoti_two/res/components/drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../fragments/home_fragment.dart';
import '../fragments/profile_fragment.dart';

import '../main.dart';
import '../model/login_model.dart';
import '../res/app_url.dart';
import '../res/components/app_bar.dart';
import '../res/components/bottom_bar.dart';
import '../res/components/drawer_item.dart';
import '../res/size_confiq.dart';
import '../res/texts.dart';
import '../utils/routes/routes.dart';
import '../utils/routes/routes_name.dart';
import '../view_model/login_view_model.dart';
import '../view_model/user_view_model.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  final drawerItems = [
    DrawerItem(Texts.home, Icons.home),
    DrawerItem(Texts.profile, Icons.person),
    DrawerItem(Texts.mykpi, "assets/26/KPI.png"),
    DrawerItem(Texts.muRoster, "assets/26/roter.png"),
    DrawerItem(Texts.myWallet, "assets/26/wallet.png"),
    DrawerItem(Texts.myHistory, Icons.history),
  ];

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showDialog = false; // Added _showDialog variable

  int _selectedDrawerIndex = 0;
  LogInModel model = LogInModel();
  String firstName_ = "";

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return const HomeFragment();
      case 1:
        return ProfileFragment();
      case 2:
        return KPIFragment();
      case 3:
        return RosterFragment();
      case 4:
        return WalletFragment();
      case 5:
        return HistoryFragment();
      /*   case 6:
        return isLogout ? LogoutCall() : LogoutFragment();
*/
      default:
        return Text("Error");
    }
  }

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  @override
  void initState() {
    super.initState();
    getToken();
    setName();
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        _showDialog = true;
      });
    });
    _firebaseMessaging.requestPermission();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print("onMessage: $message");
      _showNotification(message);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("onMessageOpenedApp: $message");

      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  Future<void> setName() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();

    setState(() {
      firstName_ = sp.getString('firstName')!;
    });
  }

  Future<void> LogoutCall() async {
    final authViewMode = Provider.of<LoginViewModel>(context, listen: false);
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
    setState(() {
      authViewMode.loginOut(uri, context);
    });
  }

  Future<bool> showExitPopup(context) async {
    return await showDialog(
      context: context,
      builder: (context) => AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: _showDialog ? 1.0 : 0.0,
        child: AlertDialog(
          title: Text(
            Texts.conformExit,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          content: Text(
            Texts.wantExit,
            style: const TextStyle(fontSize: 16),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                exit(0);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade800),
              child: Text(Texts.yes),
            ),
            SizedBox(width: SizeConfig.screenWidth * 0.10),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              child:
                  Text(Texts.no, style: const TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    String base64Image =
        "iVBORw0KGgoAAAANSUhEUgAAAQAAAAEACAIAAADTED8xAAADMElEQVR4nOzVwQnAIBQFQYXff81RUkQCOyDj1YOPnbXWPmeTRef+/3O/OyBjzh3CD95BfqICMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMK0CMO0TAAD//2Anhf4QtqobAAAAAElFTkSuQmCC";
    Uint8List bytes = base64Decode(base64Image);
    SizeConfig().init(context);

    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(ListTile(
        leading: d.icon.toString().contains("assets/")
            ? Image.asset(
                d.icon,
              )
            : Icon(d.icon as IconData),
        title: Text(d.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: Color(0xff1A237E),
            )),
        selected: i == _selectedDrawerIndex,
        onTap: () => _onSelectItem(i),
      ));
    }

    return WillPopScope(
        child: SafeArea(
            child: Scaffold(
          backgroundColor: Colors.white70,
          appBar: myAppBar(),
          //drawer: const KfcDrawer(),
          drawer: Drawer(
            child: Column(
              children: <Widget>[
                UserAccountsDrawerHeader(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.red, Colors.redAccent],
                          end: Alignment.centerLeft,
                          begin: Alignment.centerRight),
                      borderRadius: BorderRadius.all(
                        Radius.circular(1),
                      ),
                    ),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: MemoryImage(bytes),
                    ),
                    accountName: Text(
                      'Welcome Muneeb'
                      '$firstName_',
                      style: const TextStyle(
                          fontSize: 16.0, fontFamily: "Brand Bold"),
                    ),
                    accountEmail: null),
                Column(
                  children: [
                    Column(children: drawerOptions),
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
                )
              ],
            ),
          ),
          body: _getDrawerItemWidget(_selectedDrawerIndex),
          bottomNavigationBar: bottomBar(),
        )),
        onWillPop: () => showExitPopup(context));
  }

  void getToken() {
    FirebaseMessaging.instance.getToken().then((token) {
      setState(() {
        if (kDebugMode) {
          print("My token for FireBase is $token");
        }
      });
      // saveToken(mtoken!);
    });
  }

  void _showNotification(RemoteMessage message) async {
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: AndroidNotificationDetails(
        'channel_id',
        'Channel Name',
        importance: Importance.max,
        priority: Priority.high,
      ),
    );

    await flutterLocalNotificationsPlugin.show(
      0, // Notification ID
      message.notification!.title, // Notification title
      message.notification!.body, // Notification body
      platformChannelSpecifics,
    );
  }
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
