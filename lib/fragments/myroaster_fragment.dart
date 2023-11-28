import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:provider/provider.dart';

import '../data/response/status.dart';
import '../roaster/controller/myRosterController.dart';

class RosterFragment extends StatefulWidget {
  const RosterFragment({super.key});

  @override
  State<RosterFragment> createState() => _RosterFragmentState();
}

class _RosterFragmentState extends State<RosterFragment> {
  final RosterController _rosterController = Get.put(RosterController());
  var week = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white70,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Stack(
          children: <Widget>[
            GetBuilder<RosterController>(builder: (controller) {
              return Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.white,
                padding: EdgeInsets.only(left: 5, right: 5, top: 40),
                child: Column(
                  children: [
                    Row(
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                          // width: MediaQuery.of(context).size.width * 0.2,
                        ),
                        Expanded(
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.grey),
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.all(10))),
                            onPressed: () {
                              setState(() {
                                week = week - 1;
                              });
                              _rosterController.getRosterData(week.toString());
                            },
                            child: const Text(
                              'PREVIOUS WEEK',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.005,
                        ),
                        Expanded(
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.grey),
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.all(10))),
                                onPressed: () {
                                  setState(() {
                                    week = week + 1;
                                  });
                                  _rosterController
                                      .getRosterData(week.toString());
                                },
                                child: const Text('NEXT WEEK',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                    )))),
                      ],
                    ),
                    Divider(
                      color: Colors.red,
                      thickness: 3,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: controller.rosterList.length,
                        itemBuilder: ((context, index) {
                          return Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.rosterList[index].column1
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red,
                                    ),
                                  ),
                                  Text(
                                    "Start Time: ${controller.rosterList[index].startDateTime}"
                                        .toString(),
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    "End Time: ${controller.rosterList[index].endDateTime}",
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ));
                        }),
                      ),
                    )
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
