import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pushnoti_two/model/KpiModel.dart';
import 'package:pushnoti_two/model/roaster_model.dart';
import 'package:pushnoti_two/res/app_url.dart';

import '../global/global.dart';
import '../model/history_model.dart';
import '../model/rider_current_balancemodel.dart';
import '../model/rider_payment_model.dart';
import '../view_model/user_view_model.dart';

class HttpServices {
  final dio = Dio();

  Future<List<RosterModel>> getRoster(
    String week,
  ) async {
    int branchRiderId = 0;
    await UserViewModel()
        .getBranchRiderID()
        .then((value) => branchRiderId = value!);
    final response = await dio.get(AppUrl.riderRosterEndPint, queryParameters: {
      "BranchRiderID": branchRiderId,
      "week": week,
    });
    List<RosterModel> roster = [];
    if (response.statusCode == 200) {
      response.data.forEach((e) {
        roster.add(RosterModel.fromJson(e));
      });

      return roster;
    } else {
      throw response.statusCode.toString();
    }
  }

  Future updateRiderPassword(
      String updatedPassword, BuildContext context) async {
    int branchRiderId = 0;
    await UserViewModel()
        .getBranchRiderID()
        .then((value) => branchRiderId = value!);
    final response =
        await dio.get(AppUrl.riderPasswordUpdateEndPint, queryParameters: {
      "ApiUserName": "riderappuser",
      "ApiPassword": "nSFn@xxfwxM?z[=5pbt%Zu/T%^.m+!Zp{",
      "RiderID": branchRiderId.toString(),
      "password": updatedPassword,
    });

    if (response.statusCode == 200) {
      final data = (response.data);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Updated Succesfully"),
        ),
      );
    } else {
      throw response.statusCode.toString();
    }
  }

  Future getRiderProfileImage() async {
    int branchRiderId = 0;
    await UserViewModel()
        .getBranchRiderID()
        .then((value) => branchRiderId = value!);
    final response =
        await dio.get(AppUrl.riderProfileImageEndPint, queryParameters: {
      "ApiUserName": "riderappuser",
      "ApiPassword": "nSFn@xxfwxM?z[=5pbt%Zu/T%^.m+!Zp{",
      "RiderID": branchRiderId.toString(),
    });
    var profileImage;
    if (response.statusCode == 200) {
      profileImage = response.data[0];
      if (kDebugMode) {
        print(profileImage);
        // final data = json.decode(response.data[0]);
        //   print(profileImage.toString());
      }

      print('profile {$profileImage} ');
      return profileImage['profileImage'];
    } else {}
  }

  Future<List<KPIModel>> getRiderKPI(String startDate, String endDate) async {
    int branchRiderId = 0;
    await UserViewModel()
        .getBranchRiderID()
        .then((value) => branchRiderId = value!);

    List<KPIModel> kpiData = [];
    final response = await dio.get(AppUrl.riderKPIEndPint, queryParameters: {
      "ApiUserName": "riderappuser",
      "BranchRiderID": branchRiderId,
      "startDate": "11/13/2020",
      "endDate": "12/14/2020",
    });
    if (response.statusCode == 200) {
      response.data.forEach((kpi) {
        kpiData.add(KPIModel.fromJson(kpi));
      });

      return kpiData;
    } else {
      throw response.statusCode.toString();
    }
  }

  Future<List<RiderCurrentBalanceModel>> getMyWalletBalance() async {
    int branchRiderId = 0;
    await UserViewModel()
        .getBranchRiderID()
        .then((value) => branchRiderId = value!);

    final response =
        await dio.get(AppUrl.getRiderWalletBalance, queryParameters: {
      "BranchRiderID": branchRiderId,
      "date": formattedDateNow,
    });
    List<RiderCurrentBalanceModel> currentBalance = [];
    if (response.statusCode == 200) {
      response.data.forEach((balance) {
        currentBalance.add(RiderCurrentBalanceModel.fromJson(balance));
      });

      return currentBalance;
    } else {
      throw response.statusCode.toString();
    }
  }

  Future<List<RiderPaymentsModel>> getRiderWalletPayments(
    String dateTime,
  ) async {
    int branchRiderId = 0;
    await UserViewModel()
        .getBranchRiderID()
        .then((value) => branchRiderId = value!);

    final response =
        await dio.get(AppUrl.getRiderWalletPayments, queryParameters: {
      "BranchRiderID": branchRiderId,
      "date": dateTime,
    });
    List<RiderPaymentsModel> riderPayments = [];
    if (response.statusCode == 200) {
      response.data.forEach((payment) {
        riderPayments.add(RiderPaymentsModel.fromJson(payment));
      });

      return riderPayments;
    } else {
      throw response.statusCode.toString();
    }
  }

  Future<List<HistoryModel>> getRiderHistory(
      String startDate, String endDate) async {
    int branchRiderId = 0;
    await UserViewModel()
        .getBranchRiderID()
        .then((value) => branchRiderId = value!);

    final response = await dio.get(AppUrl.getRiderHistory, queryParameters: {
      "ApiUserName": "riderappuser",
      "ApiPassword": "nSFn@xxfwxM?z[=5pbt%Zu/T%^.m+!Zp{",
      //"RiderID": "17278",

      "RiderID": branchRiderId,
      "StartDate": startDate,
      "EndDate": endDate,
    });
    List<HistoryModel> riderHistory = [];
    if (response.statusCode == 200) {
      final data = response.data;

      data.forEach((history) {
        riderHistory.add(HistoryModel.fromJson(history));
      });

      return riderHistory;
    } else {
      throw response.statusCode.toString();
    }
  }
}
