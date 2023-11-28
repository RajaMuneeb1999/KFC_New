class KPIModel {
  String? averageUnder20MinutesPercentage;
  String? averageUnder30MinutesPercentage;
  dynamic averageIST;
  dynamic driveTime;
  dynamic customerDoorTime;
  dynamic returningTime;
  dynamic riderProductivity;
  dynamic numberOfOrders;
  dynamic numberOfSuccessfulOrder;
  dynamic numberOfCancelRejectOrder;
  dynamic rating;

  KPIModel(
      {this.averageUnder20MinutesPercentage,
      this.averageUnder30MinutesPercentage,
      this.averageIST,
      this.driveTime,
      this.customerDoorTime,
      this.returningTime,
      this.riderProductivity,
      this.numberOfOrders,
      this.numberOfSuccessfulOrder,
      this.numberOfCancelRejectOrder,
      this.rating});

  KPIModel.fromJson(Map<String, dynamic> json) {
    averageUnder20MinutesPercentage = json['AverageUnder20MinutesPercentage'];
    averageUnder30MinutesPercentage = json['AverageUnder30MinutesPercentage'];
    averageIST = json['AverageIST'];
    driveTime = json['DriveTime'];
    customerDoorTime = json['CustomerDoorTime'];
    returningTime = json['ReturningTime'];
    riderProductivity = json['RiderProductivity'];
    numberOfOrders = json['NumberOfOrders'];
    numberOfSuccessfulOrder = json['NumberOfSuccessfulOrder'];
    numberOfCancelRejectOrder = json['NumberOfCancelRejectOrder'];
    rating = json['Rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['AverageUnder20MinutesPercentage'] = averageUnder20MinutesPercentage;
    data['AverageUnder30MinutesPercentage'] = averageUnder30MinutesPercentage;
    data['AverageIST'] = averageIST;
    data['DriveTime'] = driveTime;
    data['CustomerDoorTime'] = customerDoorTime;
    data['ReturningTime'] = returningTime;
    data['RiderProductivity'] = riderProductivity;
    data['NumberOfOrders'] = numberOfOrders;
    data['NumberOfSuccessfulOrder'] = numberOfSuccessfulOrder;
    data['NumberOfCancelRejectOrder'] = numberOfCancelRejectOrder;
    data['Rating'] = rating;
    return data;
  }
}
