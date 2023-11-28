import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../res/components/history_widget.dart';
import '../roaster/controller/historyController.dart';

class Last7DaysHistory extends StatelessWidget {
  Last7DaysHistory({Key? key}) : super(key: key);
  HistoryController historyController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryController>(builder: (controller) {
      return controller.last7DaysHistory.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              itemCount: controller.last7DaysHistory.length,
              itemBuilder: ((context, index) {
                return myHistory(
                    controller.last7DaysHistory[index].orderNo.toString(),
                    controller.last7DaysHistory[index].statusTitle.toString(),
                    "hello",
                    controller.last7DaysHistory[index].firstName.toString(),
                    controller.last7DaysHistory[index].amount.toString(),
                    controller.last7DaysHistory[index].paymentMode.toString(),
                    "no Data");
              }),
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.010,
                );
              },
            );
    });
  }
}
