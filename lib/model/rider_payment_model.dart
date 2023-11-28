class RiderPaymentsModel {
  String? dateTime;
  double? amount;

  RiderPaymentsModel({this.dateTime, this.amount});

  RiderPaymentsModel.fromJson(Map<String, dynamic> json) {
    dateTime = json['DateTime'];
    amount = json['Amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['DateTime'] = dateTime;
    data['Amount'] = amount;
    return data;
  }
}
