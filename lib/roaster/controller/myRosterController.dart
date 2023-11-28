import 'package:get/get.dart';

import '../../global/global.dart';

class RosterController extends GetxController {
  List rosterList = [];

  @override
  void onInit() {
    getRosterData("0");
    super.onInit();
  }

  Future getRosterData(String week) async {
    rosterList = [];
    try {
      var response = await httpServices.getRoster(
        week,
      );
      for (var e in response) {
        rosterList.add(e);
      }
      update();
    } catch (e) {}
    update();
  }
}
