import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:xml/xml.dart' as xml;

import 'package:provider/provider.dart';
import 'package:pushnoti_two/view_model/user_view_model.dart';

import '../model/login_model.dart';
import '../respository/login_repository.dart';
import '../utils/routes/routes_name.dart';
import '../utils/utils.dart';

class LoginViewModel with ChangeNotifier {
  final _myRepo = LoginRepository();

  bool _loading = false;

  bool get loading => _loading;

  bool _signUpLoading = false;

  bool get signUpLoading => _signUpLoading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(Uri data, BuildContext context) async {
    setLoading(true);

    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      List<LogInModel> userData = [];

      print("this is data $data");
      value.forEach((user) {
        userData.add(LogInModel.fromJson(user));
      });
      final userPreference = Provider.of<UserViewModel>(context, listen: false);
      if (userData[0].responce == null) {
        userPreference.saveUser(userData[0]);
//add more details of user to shared pREFERENCES
        Utils.flushBarErrorMessage('Login Successfully', context);
        Navigator.pushNamed(context, RoutesName.home);
      } else {
        Utils.flushBarErrorMessage(userData[0].responce.toString(), context);
      }
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);

      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  Future<void> loginOut(Uri data, BuildContext context) async {
    setLoading(true);
/*https://hds.kfcpakistan.com/riderappservice/RiderAppService//riderLogout?ApiUserName=riderappuser&ApiPassword=nSFn%40xxfwxM%3Fz%5B%3D5pbt%25Zu%2FT%25%5E.m%2B%21Zp%7B&RiderID=17605&imei*/
    _myRepo.loginOutApi(data).then((value) async {
      setLoading(false);
      if (value == 'Success') {
        final userPreference =
            Provider.of<UserViewModel>(context, listen: false);

        await userPreference.remove();
        Utils.flushBarErrorMessage('Logout Successfully', context);
        // Use Navigator to remove the current screen.
        Navigator.canPop(context);

        // Navigate to the login screen using the defined route.
        Navigator.pushNamed(context, RoutesName.login);
      }
    });
//add more details of user to shared pREFERENCES
  }
}
