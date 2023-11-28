import 'package:get/get.dart';

import '../../global/global.dart';

class HistoryController extends GetxController {
  bool isLoading = false;
  List last7DaysHistory = [];
  List lastThirtyDaysHistory = [];
  List todayHistory = [];
  @override
  void onInit() {
    getLast7DaysHistory();
    getLast30DaysHistory();
    getTodayHistory();
    super.onInit();
  }

  Future<void> getTodayHistory() async {
    isLoading = true;

    todayHistory = [];
    try {
      var response = await httpServices.getRiderHistory(
        //"589",

          formattedDateNow.toString(),
          formattedDateNow.toString());
      for (var e in response) {
        todayHistory.add(e);
      }
      if (todayHistory[0].toString().isNotEmpty) {}

      isLoading = false;
      update();
    } catch (e) {
      isLoading = false;
    }
    update();
  }

  Future<void> getLast7DaysHistory() async {
    isLoading = true;

    last7DaysHistory = [];
    try {
      var response = await httpServices.getRiderHistory(
          formatedSevenDaysMinusNow.toString(), formattedDateNow.toString());

      for (var e in response) {
        last7DaysHistory.add(e);
      }
      if (last7DaysHistory[0].toString().isNotEmpty) {}

      isLoading = false;

      update();
    } catch (e) {
      isLoading = false;
    }
    update();
  }

  Future<void> getLast30DaysHistory() async {
    isLoading = true;

    lastThirtyDaysHistory = [];
    try {
      var response = await httpServices.getRiderHistory(
          formatedThirtyDaysMinusNow.toString(), formattedDateNow.toString());

      for (var e in response) {
        lastThirtyDaysHistory.add(e);
      }
      if (lastThirtyDaysHistory.toString().isNotEmpty) {}

      isLoading = false;

      update();
    } catch (e) {
      isLoading = false;
    }
    update();
  }
}
