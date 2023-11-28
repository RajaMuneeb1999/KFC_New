class RiderCurrentBalanceModel {
  double? walletAmount;

  RiderCurrentBalanceModel({this.walletAmount});

  RiderCurrentBalanceModel.fromJson(Map<String, dynamic> json) {
    walletAmount = json['walletAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['walletAmount'] = walletAmount;
    return data;
  }
}
