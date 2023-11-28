import 'package:flutter/material.dart';

import '../size_confiq.dart';


//This widget is for home screen active orders.
activeOrderWidget(
    BuildContext context,
    String orderNo,
    String orderStatus,
    String branchName,
    String deliveryAddress,
    String assignedTime,
    String readyTime) {
  SizeConfig().init(context);
  return Container(
    //margin: EdgeInsets.only(left: 10, right: 10),
    //padding: EdgeInsets.only(left: 10, right: 10),
    decoration: const BoxDecoration(
      color: Colors.white,
      boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.black54, blurRadius: 15.0, offset: Offset(0.0, 0.75))
      ],
    ),
    height: SizeConfig.screenHeight * 0.27,
    width: SizeConfig.screenWidth * 0.95,

    child: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(getProportionateScreenWidth(8.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                orderNo,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                height: SizeConfig.screenHeight * 0.030,
                width: SizeConfig.screenWidth * 0.18,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: (BorderRadius.circular(30)),
                ),
                child: const Center(
                  child: Text(
                    "Active",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(
          color: Colors.black54,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(
              0.0, getProportionateScreenHeight(10.0), 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/drawable-xhdpi/path.png",
                    height: SizeConfig.screenHeight * 0.1,
                    width: SizeConfig.screenWidth * 0.19,
                  ),
                  Column(
                    children: [
                      Text(branchName),
                      SizedBox(
                        height: SizeConfig.screenHeight * 0.055,
                      ),
                      Text(
                        deliveryAddress,
                        maxLines: 3,
                        overflow: TextOverflow.visible,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: SizeConfig.screenHeight * 0.030,
        ),
        Padding(
          padding: EdgeInsets.only(
              left: getProportionateScreenWidth(50.0),
              right: getProportionateScreenWidth(8.0)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Assigned Time: $assignedTime"),
              Container(
                height: SizeConfig.screenHeight * 0.030,
                width: SizeConfig.screenWidth * 0.28,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: (BorderRadius.circular(30)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(
                      Icons.repeat,
                      color: Colors.white,
                    ),
                    Center(
                      child: Text(
                        "Order Ready",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    ),
  );
}
