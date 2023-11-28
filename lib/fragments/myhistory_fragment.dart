import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../history_screens/last_30_days_history.dart';
import '../history_screens/last_7_days_history.dart';
import '../history_screens/today_hIstory.dart';
import '../roaster/controller/historyController.dart';

class HistoryFragment extends StatelessWidget {
   HistoryFragment({super.key});
  HistoryController historyController = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    TabController? _tabController;

    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                  ),
                ),
                child: TabBar(
                  labelPadding: const EdgeInsets.all(10),
                  indicator: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.blue, Colors.blue.shade200]),
                    border: Border.all(
                      color: Colors.blue,
                    ),
                    color: Colors.blue,
                  ),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.grey,
                  controller: _tabController,
                  tabs: const [
                    Text('Today'),
                    Text('Last 7 Days'),
                    Text('Last 30 Days'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  const TodayHistory(),
                  Last7DaysHistory(),
                  LastThirtyDaysHistory()
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}
