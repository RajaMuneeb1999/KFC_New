import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../res/size_confiq.dart';
import '../roaster/controller/myKPIController.dart';
import '../utils/utils.dart';

class KPIFragment extends StatefulWidget {
  const KPIFragment({super.key});

  @override
  State<KPIFragment> createState() => _KPIFragmentState();
}

class _KPIFragmentState extends State<KPIFragment> {
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  final KpiController _kpiController = Get.put(KpiController());

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      body: SingleChildScrollView(
        child: GetBuilder<KpiController>(builder: (controller) {
          return controller.kpi.isEmpty
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    Container(
                      // height: MediaQuery.of(context).size.height * 0.2,
                      color: Colors.grey.shade300,
                      padding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 50),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Rider Rating',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.grey.shade500),
                              ),
                              RatingBar.builder(
                                unratedColor: Colors.red,
                                initialRating: 0,
                                minRating: 1,
                                direction: Axis.horizontal,
                                itemSize: 20,
                                // allowHalfRating: true,
                                itemCount: 5,
                                // itemPadding: EdgeInsets.symmetric(horizontal: 0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star_border_outlined,
                                  color: Colors.red,
                                ),
                                onRatingUpdate: (rating) {},
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Productivity',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade600),
                              ),
                              Text(
                                '--',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.grey.shade500),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    // GetBuilder<KpiController>(builder: ((controller) {
                    //   return Text(controller.kpi[0].returningTime);
                    // })),
                    Container(
                      color: Colors.blueGrey.shade50,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 3),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: SizeConfig.screenWidth * 0.085,
                                width: SizeConfig.screenHeight * 0.16,
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: TextFormField(
                                  readOnly: true,
                                  onTap: () {
                                    FocusScope.of(context)
                                        .requestFocus(new FocusNode());
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2001),
                                      lastDate: DateTime(2050),
                                    ).then((selectedDate) {
                                      if (selectedDate == null) {
                                        debugPrint('No Date Selected');
                                      }
                                      if (selectedDate != null) {
                                        String formattedDate =
                                            DateFormat('MM/dd/yyyy')
                                                .format(selectedDate);

                                        setState(() {
                                          startDate.text = formattedDate;
                                        });
                                      }
                                    });
                                  },
                                  controller: startDate,
                                  decoration: InputDecoration(
                                      focusColor: Colors.white,
                                      fillColor: Colors.white,
                                      filled: true,
                                      enabledBorder: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      // hintText: '11/17/2021',
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 5),
                                      hintStyle:
                                          TextStyle(color: Colors.black)),
                                ),
                              ),
                              Container(
                                height: SizeConfig.screenWidth * 0.085,
                                width: SizeConfig.screenHeight * 0.16,
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                child: TextFormField(
                                  readOnly: true,
                                  onTap: () {
                                    FocusScope.of(context)
                                        .requestFocus(new FocusNode());
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2001),
                                      lastDate: DateTime(2050),
                                    ).then((selectedDate) {
                                      if (selectedDate == null) {}
                                      if (selectedDate != null) {
                                        String formattedDate =
                                            DateFormat('MM/dd/yyyy')
                                                .format(selectedDate);

                                        setState(() {
                                          endDate.text = formattedDate;
                                        });
                                      }
                                    });
                                  },
                                  controller: endDate,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      fillColor: Colors.white,
                                      filled: true,
                                      enabledBorder: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      // hintText: '11/17/2021',
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 5),
                                      hintStyle:
                                          TextStyle(color: Colors.black)),
                                ),
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.grey.shade300),
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.all(5))),
                                onPressed: () {
                                  if (Validation()) {
                                    controller.kpi = [];
                                    setState(() {});
                                    _kpiController.getKpiData(
                                        startDate.toString(),
                                        endDate.toString());
                                  }
                                },
                                child: const Text(
                                  'GET DATA',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Order Summary',
                            style: TextStyle(
                                fontSize: 18, color: Colors.grey.shade500),
                          ),
                          SizedBox(height: 15),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 4,
                                          offset: Offset(3, 3),
                                        ),
                                      ],
                                      color: Colors.white,
                                    ),
                                    width: MediaQuery.of(context).size.width *
                                        0.2851,
                                    height: MediaQuery.of(context).size.height *
                                        0.125,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/drawable-xxhdpi/today_mini_icon.png',
                                              height: 35,
                                              width: 35,
                                            ),
                                            Container(
                                              color: Colors.grey.shade200,
                                              height: 40,
                                              width: 2,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 5),
                                            ),
                                            Text(controller.kpi[0]
                                                .averageUnder20MinutesPercentage
                                                .toString()),
                                          ],
                                        ),
                                        new Divider(
                                          thickness: 1,
                                          color: Colors.grey.shade200,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Under 20',
                                              style: TextStyle(
                                                  color: Colors.grey.shade500),
                                            ),
                                            Text(
                                              'Minutes',
                                              style: TextStyle(
                                                  color: Colors.grey.shade500),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 4,
                                          offset: Offset(3, 3),
                                        ),
                                      ],
                                      color: Colors.white,
                                    ),
                                    width: MediaQuery.of(context).size.width *
                                        0.2851,
                                    height: MediaQuery.of(context).size.height *
                                        0.125,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/drawable-xxhdpi/last_seven_icon.png',
                                              height: 35,
                                              width: 35,
                                            ),
                                            Container(
                                              color: Colors.grey.shade200,
                                              height: 40,
                                              width: 2,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 5),
                                            ),
                                            Text(controller.kpi[0]
                                                .averageUnder30MinutesPercentage
                                                .toString()),
                                          ],
                                        ),
                                        new Divider(
                                          thickness: 1,
                                          color: Colors.grey.shade200,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Under 30',
                                              style: TextStyle(
                                                  color: Colors.grey.shade500),
                                            ),
                                            Text(
                                              'Minutes',
                                              style: TextStyle(
                                                  color: Colors.grey.shade500),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 4,
                                          offset: Offset(3, 3),
                                        ),
                                      ],
                                      color: Colors.white,
                                    ),
                                    width: MediaQuery.of(context).size.width *
                                        0.2851,
                                    height: MediaQuery.of(context).size.height *
                                        0.125,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/drawable-xxhdpi/last_thirty_icon.png',
                                              height: 35,
                                              width: 35,
                                            ),
                                            Container(
                                              color: Colors.grey.shade200,
                                              height: 40,
                                              width: 2,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 5),
                                            ),
                                            Text(controller.kpi[0].averageIST
                                                .toString()),
                                          ],
                                        ),
                                        new Divider(
                                          thickness: 1,
                                          color: Colors.grey.shade200,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Average IST',
                                              style: TextStyle(
                                                  color: Colors.grey.shade500),
                                            ),
                                            Text(
                                              '',
                                              style: TextStyle(
                                                  color: Colors.grey.shade500),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 4,
                                          offset: Offset(3, 3),
                                        ),
                                      ],
                                      color: Colors.white,
                                    ),
                                    width: MediaQuery.of(context).size.width *
                                        0.2851,
                                    height: MediaQuery.of(context).size.height *
                                        0.125,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/drawable-xxhdpi/today_mini_icon.png',
                                              height: 35,
                                              width: 35,
                                            ),
                                            Container(
                                              color: Colors.grey.shade200,
                                              height: 40,
                                              width: 2,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 5),
                                            ),
                                            Text(controller.kpi[0].driveTime
                                                .toString()),
                                          ],
                                        ),
                                        new Divider(
                                          thickness: 1,
                                          color: Colors.grey.shade200,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Driver Time',
                                              style: TextStyle(
                                                  color: Colors.grey.shade500),
                                            ),
                                            Text(
                                              '',
                                              style: TextStyle(
                                                  color: Colors.grey.shade500),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 4,
                                          offset: Offset(3, 3),
                                        ),
                                      ],
                                      color: Colors.white,
                                    ),
                                    width: MediaQuery.of(context).size.width *
                                        0.2851,
                                    height: MediaQuery.of(context).size.height *
                                        0.125,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/drawable-xxhdpi/last_seven_icon.png',
                                              height: 35,
                                              width: 35,
                                            ),
                                            Container(
                                              color: Colors.grey.shade200,
                                              height: 40,
                                              width: 2,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 5),
                                            ),
                                            Text(controller
                                                .kpi[0].customerDoorTime
                                                .toString()),
                                          ],
                                        ),
                                        new Divider(
                                          thickness: 1,
                                          color: Colors.grey.shade200,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Customer Door',
                                              style: TextStyle(
                                                  color: Colors.grey.shade500),
                                            ),
                                            Text(
                                              'Time',
                                              style: TextStyle(
                                                  color: Colors.grey.shade500),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 4,
                                          offset: Offset(3, 3),
                                        ),
                                      ],
                                      color: Colors.white,
                                    ),
                                    width: MediaQuery.of(context).size.width *
                                        0.2851,
                                    height: MediaQuery.of(context).size.height *
                                        0.125,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/drawable-xxhdpi/last_thirty_icon.png',
                                              height: 35,
                                              width: 35,
                                            ),
                                            Container(
                                              color: Colors.grey.shade200,
                                              height: 40,
                                              width: 2,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 5),
                                            ),
                                            Text(controller
                                                        .kpi[0].returningTime ==
                                                    null
                                                ? "0"
                                                : controller
                                                    .kpi[0].returningTime
                                                    .toString()),
                                          ],
                                        ),
                                        new Divider(
                                          thickness: 1,
                                          color: Colors.grey.shade200,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Returning Time',
                                              style: TextStyle(
                                                  color: Colors.grey.shade500),
                                            ),
                                            Text(
                                              '',
                                              style: TextStyle(
                                                  color: Colors.grey.shade500),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 4,
                                          offset: Offset(3, 3),
                                        ),
                                      ],
                                      color: Colors.white,
                                    ),
                                    width: MediaQuery.of(context).size.width *
                                        0.2851,
                                    height: MediaQuery.of(context).size.height *
                                        0.125,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/drawable-xxhdpi/today_mini_icon.png',
                                              height: 35,
                                              width: 35,
                                            ),
                                            Container(
                                              color: Colors.grey.shade200,
                                              height: 40,
                                              width: 2,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 5),
                                            ),
                                            Text(controller
                                                .kpi[0].numberOfOrders
                                                .toString()),
                                          ],
                                        ),
                                        new Divider(
                                          thickness: 1,
                                          color: Colors.grey.shade200,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Total Orders',
                                              style: TextStyle(
                                                  color: Colors.grey.shade500),
                                            ),
                                            Text(
                                              '',
                                              style: TextStyle(
                                                  color: Colors.grey.shade500),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 4,
                                          offset: Offset(3, 3),
                                        ),
                                      ],
                                      color: Colors.white,
                                    ),
                                    width: MediaQuery.of(context).size.width *
                                        0.2851,
                                    height: MediaQuery.of(context).size.height *
                                        0.125,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/drawable-xxhdpi/last_seven_icon.png',
                                              height: 35,
                                              width: 35,
                                            ),
                                            Container(
                                              color: Colors.grey.shade200,
                                              height: 40,
                                              width: 2,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 5),
                                            ),
                                            Text(controller
                                                .kpi[0].numberOfSuccessfulOrder
                                                .toString()),
                                          ],
                                        ),
                                        new Divider(
                                          thickness: 1,
                                          color: Colors.grey.shade200,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Successful',
                                              style: TextStyle(
                                                  color: Colors.grey.shade500),
                                            ),
                                            Text(
                                              'Orders',
                                              style: TextStyle(
                                                  color: Colors.grey.shade500),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 4,
                                          offset: Offset(3, 3),
                                        ),
                                      ],
                                      color: Colors.white,
                                    ),
                                    width: MediaQuery.of(context).size.width *
                                        0.2851,
                                    height: MediaQuery.of(context).size.height *
                                        0.125,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              'assets/drawable-xxhdpi/last_thirty_icon.png',
                                              height: 35,
                                              width: 35,
                                            ),
                                            Container(
                                              color: Colors.grey.shade200,
                                              height: 40,
                                              width: 2,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 5),
                                            ),
                                            Text(controller.kpi[0]
                                                .numberOfCancelRejectOrder
                                                .toString()),
                                          ],
                                        ),
                                        new Divider(
                                          thickness: 1,
                                          color: Colors.grey.shade200,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Cancel/Reject',
                                              style: TextStyle(
                                                  color: Colors.grey.shade500),
                                            ),
                                            Text(
                                              'Orders',
                                              style: TextStyle(
                                                  color: Colors.grey.shade500),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
        }),
      ),
    );
  }

  bool Validation() {
    if (startDate.text.isEmpty) {
      Utils.flushBarErrorMessage('Please enter Start Date', context);
      return false;
    } else if (endDate.text.isEmpty) {
      Utils.flushBarErrorMessage('Please Enter End Date', context);
      return false;
    }
    /* else {
      DateTime startdt = DateTime.parse(startDate.text);
      DateTime enddt = DateTime.parse(endDate.text);
      bool valDate = startdt.isBefore(enddt);
      if (!valDate) {
        Utils.flushBarErrorMessage(
            'Start Date must be before then end date', context);
        return false;
      } else if (startdt.isAtSameMomentAs(enddt)) {
        Utils.flushBarErrorMessage('Both Dates not be same', context);
        return false;
      }
    }*/
    return true;
  }
}
