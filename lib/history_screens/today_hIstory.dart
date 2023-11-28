import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../res/components/history_widget.dart';
import '../res/size_confiq.dart';
import '../roaster/controller/historyController.dart';

class TodayHistory extends StatefulWidget {
  const TodayHistory({Key? key}) : super(key: key);

  @override
  _TodayHistoryState createState() => _TodayHistoryState();
}

class _TodayHistoryState extends State<TodayHistory> {
  HistoryController historyController = Get.put(HistoryController());
  String dropdownValue = 'All';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var rating;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white70,
        body: Center(
            child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.grey.shade200,
          child: Column(
            children: [
              SizedBox(
                height: SizeConfig.screenHeight * 0.01,
              ),
              // DropdownButton<String>(
              //   value: dropdownValue,
              //   underline: Container(
              //     height: 3,
              //   ),
              //   onChanged: (String? newValue) {
              //     setState(() {
              //       dropdownValue = newValue!;
              //     });
              //   },
              //   items: <String>['All', 'One', 'Two', 'Others']
              //       .map<DropdownMenuItem<String>>((String value) {
              //     return DropdownMenuItem<String>(
              //       value: value,
              //       child: Text(value),
              //     );
              //   }).toList(),
              // ),

              GetBuilder<HistoryController>(builder: (controller) {
                return controller.todayHistory.isEmpty
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Expanded(
                        //  child: Text(controller.todayHistory[0].amount.toString()),
                        child: ListView.separated(
                          itemCount: controller.todayHistory.length,
                          itemBuilder: ((context, index) {
                            return myHistory(
                                controller.todayHistory[index].orderNo
                                    .toString(),
                                controller.todayHistory[index].statusTitle
                                    .toString(),
                                "hello",
                                controller.todayHistory[index].firstName
                                    .toString(),
                                controller.todayHistory[index].amount
                                    .toString(),
                                controller.todayHistory[index].paymentMode
                                    .toString(),
                                "no data");
                          }),
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.010,
                            );
                          },
                        ),
                      );
              }),
            ],
          ),
        )),
      ),
    );
  }
}
