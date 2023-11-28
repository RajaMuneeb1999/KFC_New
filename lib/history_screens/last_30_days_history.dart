import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../res/components/history_widget.dart';
import '../roaster/controller/historyController.dart';

class LastThirtyDaysHistory extends StatelessWidget {
  LastThirtyDaysHistory({Key? key}) : super(key: key);

  HistoryController historyController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryController>(builder: (controller) {
      return controller.lastThirtyDaysHistory.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              itemCount: controller.lastThirtyDaysHistory.length,
              itemBuilder: ((context, index) {
                return myHistory(
                    controller.lastThirtyDaysHistory[index].orderNo.toString(),
                    controller.lastThirtyDaysHistory[index].statusTitle
                        .toString(),
                    "hello",
                    controller.lastThirtyDaysHistory[index].firstName
                        .toString(),
                    controller.lastThirtyDaysHistory[index].amount.toString(),
                    controller.lastThirtyDaysHistory[index].paymentMode
                        .toString(),
                    "no data");
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
