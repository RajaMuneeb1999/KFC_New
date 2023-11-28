import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../res/size_confiq.dart';
import '../roaster/controller/myWalletController.dart';
import '../utils/utils.dart';

class WalletFragment extends StatefulWidget {
  const WalletFragment({super.key});

  @override
  State<WalletFragment> createState() => _WalletFragmentState();
}

class _WalletFragmentState extends State<WalletFragment> {
  final MyWalletController _myWalletController = Get.put(MyWalletController());

  TextEditingController dateConroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(child: Scaffold(
      body: GetBuilder<MyWalletController>(
        builder: (_) {
          return _.currentBalance.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          "Current Balance:",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.04,
                        ),
                        Text(
                          _.currentBalance[0].walletAmount.toString(),
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.04,
                        ),
                        GestureDetector(
                            child: Image.asset(
                                "assets/drawable-xhdpi/arrows.png")),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: SizeConfig.screenWidth * 0.085,
                          width: SizeConfig.screenHeight * 0.16,
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            readOnly: true,
                            onTap: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2001),
                                lastDate: DateTime(2050),
                              ).then((selectedDate) {
                                if (selectedDate == null) {}
                                if (selectedDate != null) {
                                  String formattedDate =
                                      DateFormat('MM/dd/yyyy')
                                          .format(selectedDate);

                                  setState(() {
                                    dateConroller.text = formattedDate;
                                  });
                                }
                              });
                            },
                            controller: dateConroller,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                // hintText: '11/17/2021',
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 5),
                                hintStyle: TextStyle(color: Colors.black)),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.04,
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(
                                  MediaQuery.of(context).size.width * 0.3, 0),
                              // backgroundColor: Colors.orange,
                            ),
                            onPressed: () {
                              if (dateConroller.text.isEmpty) {
                                Utils.flushBarErrorMessage(
                                    'Please enter Date Field', context);
                              } else {
                                _myWalletController
                                    .getRiderPayments(dateConroller.text);
                              }
                            },
                            child: const Text("Search"))
                      ],
                    ),
                    const Divider(
                      color: Colors.red,
                      thickness: 2.5,
                    ),
                    _.riderPayments.isEmpty
                        ? Container()
                        : SizedBox(
                            width: MediaQuery.of(context).size.width * 0.90,
                            height: MediaQuery.of(context).size.width * 0.90,
                            child: Column(
                              children: [
                                SizedBox(
                                  child: Container(
                                    color: Colors.red,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: const [
                                        Text("Date/Time"),
                                        Text("Amount"),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: _.riderPayments.length,
                                    itemBuilder: ((context, index) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(_.riderPayments[index].dateTime
                                              .toString()),
                                          Text(_.riderPayments[index].amount
                                              .toString()),
                                        ],
                                      );
                                    }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  ],
                );
        },
      ),
    ));
  }
}
