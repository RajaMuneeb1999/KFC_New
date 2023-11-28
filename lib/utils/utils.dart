import 'dart:io';

import 'package:device_imei/device_imei.dart';

import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:permission_handler/permission_handler.dart';

class Utils {
  static double averageRating(List<int> rating) {
    var avgRating = 0;
    for (int i = 0; i < rating.length; i++) {
      avgRating = avgRating + rating[i];
    }
    return double.parse((avgRating / rating.length).toStringAsFixed(1));
  }

/*used for update the focus to next widget */
  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(15),
        message: message,
        duration: const Duration(seconds: 3),
        borderRadius: BorderRadius.circular(8),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: Colors.red,
        reverseAnimationCurve: Curves.easeInOut,
        positionOffset: 20,
        icon: const Icon(
          Icons.error,
          size: 28,
          color: Colors.white,
        ),
      )..show(context),
    );
  }

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(backgroundColor: Colors.red, content: Text(message)));
  }

  static Future<String?> getImei() async {
    String _platformVersion = 'Unknown';
    String? deviceImei;
    String? type;
    String message = "Please allow permission request!";
    DeviceInfo? deviceInfo;
    bool getPermission = false;
    bool isloading = false;

    var permission = await Permission.phone.status;
    final deviceImeiPlugin = DeviceImei();
    DeviceInfo? dInfo = await deviceImeiPlugin.getDeviceInfo();

    if (dInfo != null) {
      deviceInfo = dInfo;
    }

    if (Platform.isAndroid) {
      if (permission.isGranted) {
        String? imei = await deviceImeiPlugin.getDeviceImei();
        if (imei != null) {
          getPermission = true;
          deviceImei = imei;
          return deviceImei;
        }
      } else {
        PermissionStatus status = await Permission.phone.request();
        if (status == PermissionStatus.granted) {
          getPermission = false;

          getImei();
        } else {
          getPermission = false;
          message = "Permission not granted, please allow permission";
          return deviceImei;
        }
      }
    } else {
      String? imei = await deviceImeiPlugin.getDeviceImei();
      if (imei != null) {
        getPermission = true;
        deviceImei = imei;
        return deviceImei;
      }
    }
  }

   static Future<String?> requestPermissions() async {
    var status = await Permission.phone.request();
    if (status.isGranted) {
      // You can now safely access device identifiers like the IMEI
      String? imei = await getImei();

      print("IMEI number: $imei");
      return imei;
    } else {
      // Handle permission denied
      return "";
    }
  }

}
