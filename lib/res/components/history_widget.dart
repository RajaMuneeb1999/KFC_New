import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../size_confiq.dart';

Widget myHistory(
    String orderNo,
    String statusTitle,
    String rating,
    String customerName,
    String amount,
    String paymenyMode,
    String distanceTime) {
  return Container(
    color: Colors.white,
    width: SizeConfig.screenWidth * 0.95,
    child: Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            'Order No:',
            style: TextStyle(color: Colors.grey, fontSize: 15),
          ),
          Text(
            orderNo,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(
            statusTitle,
            style: const TextStyle(fontSize: 15, color: Colors.grey),
          ),
          RatingBar.builder(
              unratedColor: Colors.red,
              initialRating: 0,
              minRating: 1,
              direction: Axis.horizontal,
              itemSize: 20,
              // allowHalfRating: true,
              itemCount: 4,
              // itemPadding: EdgeInsets.symmetric(horizontal: 0),
              itemBuilder: (context, _) => const Icon(
                    Icons.star_border_outlined,
                    color: Colors.red,
                  ),
              onRatingUpdate: (rating) {}),
        ],
      ),
      Divider(
        color: Colors.grey.shade200,
        thickness: 3,
      ),
      Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Padding(padding: EdgeInsets.only(left: 5)),

          SizedBox(
            width: SizeConfig.screenWidth * 0.01,
            height: SizeConfig.screenHeight * 0.065,
          ),
          Expanded(
            child: Column(
              children: [
                const Text(
                  'Customer Name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.red,
                  ),
                ),
                // AutoSizeText(
                //   customerName,
                //   style: TextStyle(fontSize: 15), // Set a starting font size
                //   maxLines: 1, // Limit to a single line
                //   // textAlign: TextAlign.center,
                //   minFontSize: 10, // Minimum font size allowed
                //   overflow: TextOverflow.ellipsis,
                // ),
                Text(
                  customerName,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: SizeConfig.screenWidth * 0.1,
          ),
          Column(
            children: [
              const Text(
                'Amount (Rs.)',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.red,
                ),
              ),
              Text(
                "$amount ($paymenyMode)",
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          SizedBox(
            width: SizeConfig.screenWidth * 0.1,
          ),
          Expanded(
            child: Column(
              children: [
                const Text(
                  'Distance/Time',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.red,
                  ),
                ),
                Text(
                  distanceTime,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ]),
  );
}
