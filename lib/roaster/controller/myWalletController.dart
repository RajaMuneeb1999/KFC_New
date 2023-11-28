import 'package:get/get.dart';

import '../../global/global.dart';

class MyWalletController extends GetxController {
  List currentBalance = [];
  List riderPayments = [];

  @override
  void onInit() {
    super.onInit();
    getWalletBalance();
  }

  Future getWalletBalance() async {
    currentBalance = [];
    try {
      var response = await httpServices.getMyWalletBalance();
      for (var e in response) {
        currentBalance.add(e);
      }
      update();
    } catch (e) {}
    update();
  }

  Future getRiderPayments(String dateTime) async {
    riderPayments = [];
    try {
      var response = await httpServices.getRiderWalletPayments(
        dateTime,
      );
      for (var e in response) {
        riderPayments.add(e);
      }
      update();
    } catch (e) {
      throw e.toString();
    }
    update();
  }
}
