import 'package:get/get.dart';

import '../../global/global.dart';

class RiderProfileController extends GetxController {
  var profilePic;

  Future<void> getUserData(String userName, String password) async {
    profilePic;
    try {
      var response = await httpServices.getRiderProfileImage();
      for (var e in response) {
        profilePic = e;
      }
      // print('asd');
      // print("Profile... Pic $profilePic");
      update();
    } catch (e) {}
    update();
  }
}
