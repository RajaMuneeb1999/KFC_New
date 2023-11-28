import 'package:get/state_manager.dart';

import '../../global/global.dart';

class KpiController extends GetxController {
  List kpi = [];

  @override
  void onInit() {
    getKpiData(formattedDateNow.toString(), formattedDateNow.toString());
    super.onInit();
  }

  Future<void> getKpiData(String startDate, String endDate) async {
    kpi = [];
    try {
      var response = await httpServices.getRiderKPI(startDate, endDate);
      for (var e in response) {
        kpi.add(e);
      }
      update();
    } catch (e) {}
    update();
  }
}
