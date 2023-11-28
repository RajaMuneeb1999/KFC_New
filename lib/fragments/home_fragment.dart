import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../res/components/active_order.dart';
import '../res/components/bottom_bar.dart';
import '../res/size_confiq.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class HomeFragment extends StatefulWidget {
  const HomeFragment({super.key});

  @override
  State<HomeFragment> createState() => _HomeFragmentState();
}

class _HomeFragmentState extends State<HomeFragment> {
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    initConnectivity();

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      debugPrint('Could\'t check connectivity status $e');
      return;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white70,
      //    bottomNavigationBar:  bottomBar(),
      body: Center(
        child: Column(
         //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: SizeConfig.screenHeight * 0.070,
              width: SizeConfig.screenWidth * 1,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        _connectionStatus.toString().contains("wifi") ||
                                _connectionStatus
                                    .toString()
                                    .contains("mobile")
                            ? Row(
                                children: [
                                  Container(
                                    height: SizeConfig.screenHeight * 0.015,
                                    width: SizeConfig.screenWidth * 0.020,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.green,
                                          spreadRadius: 2,
                                          blurRadius: 2,
                                          //offset: Offset(3, 3),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.02,
                                  ),
                                  const Text(
                                    "Connected",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  )
                                ],
                              )
                            : Row(
                                children: [
                                  Container(
                                    height: SizeConfig.screenHeight * 0.015,
                                    width: SizeConfig.screenWidth * 0.020,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.red,
                                          spreadRadius: 2,
                                          blurRadius: 2,
                                          //offset: Offset(3, 3),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.02,
                                  ),
                                  const Text(
                                    "Disconnected",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  ),
                                ],
                              ),
                        Row(
                          children: [
                            Image.asset(
                              "assets/drawable-xxhdpi/green_gps.png",
                              height: SizeConfig.screenHeight * 0.040,
                              width: SizeConfig.screenWidth * 0.030,
                            ),
                            SizedBox(
                              width: SizeConfig.screenWidth * 0.020,
                            ),
                            const Text(
                              "GPS ON",
                              style: TextStyle(fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text(controller.user[0].firstName.toString()),
                    //     const Text("Last Sync 10:20:33"),
                    //   ],
                    // ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight * 0.030,
            ),
            // GetBuilder<HomeScreenController>(
            //   builder: ((newcontroller) {
            //     newcontroller.newOrder.length = 1;
            //     return newcontroller.newOrder.isNotEmpty
            //         ? newOrderNotificationDialog(context)
            //         : const SizedBox();
            //   }),
            // ),
            ElevatedButton(
                onPressed: () {
                  /*  newOrderNotificationDialog(context);
                  _homeScreenController.newOrder.add("1");
                  print("length ${_homeScreenController.newOrder.length}");*/
                },
                // Platform.isAndroid
                //     ? () {
                //         Workmanager().registerPeriodicTask(
                //           simplePeriodicTask,
                //           simplePeriodicTask,
                //           initialDelay: const Duration(seconds: 10),
                //         );
                //       }
                //     : null,
                child: const Text("test")),
            /*  Container(
              padding: const EdgeInsets.all(8.0),
              height: SizeConfig.screenHeight * 0.71,
              child: GetBuilder<HomeScreenController>(builder: (cont) {
                return Stack(
                  children: [
                    GetBuilder<CurrentOrdersController>(
                      builder: ((controller) {
                        return controller.currentOrders.isEmpty
                            ? const Text("No active orders")
                            : ListView.separated(
                            itemCount: controller.currentOrders.length,
                            itemBuilder: ((context, index) {
                              return GestureDetector(
                                  onTap: () {
                                 */ /*   Get.to(const ActiveOrderDetails(),
                                        arguments: index);*/ /*
                                  },
                                  child: activeOrderWidget(
                                      context,
                                      controller
                                          .currentOrders[index].orderNo
                                          .toString(),
                                      controller.currentOrders[index]
                                          .orderStatus
                                          .toString(),
                                      controller.currentOrders[index]
                                          .branchName
                                          .toString(),
                                      controller.currentOrders[index]
                                          .deliveryAddress
                                          .toString(),
                                      controller.currentOrders[index]
                                          .bookedTime
                                          .toString(),
                                      "23"));
                            }),
                            separatorBuilder: ((context, index) {
                              return SizedBox(
                                height: SizeConfig.screenHeight * 0.030,
                              );
                            }));
                      }),
                    ),
                  */ /*  cont.newOrder.isNotEmpty
                        ? SizedBox(child: newOrderNotification())
                        : SizedBox()*/ /*
                  ],
                );
              }),
            ),*/
          ],
        ),
      ),
    );
  }
}
