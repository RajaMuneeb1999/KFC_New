class HistoryModel {
  dynamic deliveryOrderID;
  dynamic orderNo;
  dynamic orderStatus;
  dynamic branchRiderID;
  String? firstName;
  dynamic amount;
  dynamic phone1;
  String? bTitle;
  String? branchName;
  String? lTitle;
  String? deliveryAddress;
  String? statusTitle;
  String? bFirstName;
  String? bMiddleName;
  String? bLastName;
  String? bookedDate;
  String? bookedTime;
  String? dispatchedDate;
  String? dispatchedTime;
  String? receivedByDate;
  String? receivedByTime;
  String? finalStatusDate;
  String? finalStatusTime;
  String? instruction;
  String? agentName;
  String? finalStatusBy;
  dynamic cancelComment;
  dynamic partialRejectComment;
  String? paymentMode;
  dynamic remainingMinuts2;
  dynamic remainingMinuts;
  dynamic minutsToBooked;
  dynamic minutsRequiredToDelivered;
  dynamic minutsToBooked1;
  bool? isPusshToPOS;
  bool? deliverOnBranch;
  dynamic offlineOrder;
  bool? isModified;
  String? orderThrough;
  dynamic rating;
  dynamic rating2;
  dynamic rating3;
  String? distanceByRider;

  HistoryModel(
      {this.deliveryOrderID,
      this.orderNo,
      this.orderStatus,
      this.branchRiderID,
      this.firstName,
      this.amount,
      this.phone1,
      this.bTitle,
      this.branchName,
      this.lTitle,
      this.deliveryAddress,
      this.statusTitle,
      this.bFirstName,
      this.bMiddleName,
      this.bLastName,
      this.bookedDate,
      this.bookedTime,
      this.dispatchedDate,
      this.dispatchedTime,
      this.receivedByDate,
      this.receivedByTime,
      this.finalStatusDate,
      this.finalStatusTime,
      this.instruction,
      this.agentName,
      this.finalStatusBy,
      this.cancelComment,
      this.partialRejectComment,
      this.paymentMode,
      this.remainingMinuts2,
      this.remainingMinuts,
      this.minutsToBooked,
      this.minutsRequiredToDelivered,
      this.minutsToBooked1,
      this.isPusshToPOS,
      this.deliverOnBranch,
      this.offlineOrder,
      this.isModified,
      this.orderThrough,
      this.rating,
      this.rating2,
      this.rating3,
      this.distanceByRider});

  HistoryModel.fromJson(Map<String, dynamic> json) {
    deliveryOrderID = json['DeliveryOrderID'];
    orderNo = json['OrderNo'];
    orderStatus = json['OrderStatus'];
    branchRiderID = json['BranchRiderID'];
    firstName = json['FirstName'];
    amount = json['Amount'];
    phone1 = json['Phone1'];
    bTitle = json['bTitle'];
    branchName = json['Branch_Name'];
    lTitle = json['lTitle'];
    deliveryAddress = json['DeliveryAddress'];
    statusTitle = json['StatusTitle'];
    bFirstName = json['bFirstName'];
    bMiddleName = json['bMiddleName'];
    bLastName = json['bLastName'];
    bookedDate = json['BookedDate'];
    bookedTime = json['BookedTime'];
    dispatchedDate = json['DispatchedDate'];
    dispatchedTime = json['DispatchedTime'];
    receivedByDate = json['ReceivedByDate'];
    receivedByTime = json['ReceivedByTime'];
    finalStatusDate = json['FinalStatusDate'];
    finalStatusTime = json['FinalStatusTime'];
    instruction = json['Instruction'];
    agentName = json['AgentName'];
    finalStatusBy = json['FinalStatusBy'];
    cancelComment = json['CancelComment'];
    partialRejectComment = json['PartialRejectComment'];
    paymentMode = json['PaymentMode'];
    remainingMinuts2 = json['RemainingMinuts2'];
    remainingMinuts = json['RemainingMinuts'];
    minutsToBooked = json['MinutsToBooked'];
    minutsRequiredToDelivered = json['minutsRequiredToDelivered'];
    minutsToBooked1 = json['MinutsToBooked1'];
    isPusshToPOS = json['IsPusshToPOS'];
    deliverOnBranch = json['deliverOnBranch'];
    offlineOrder = json['OfflineOrder'];
    isModified = json['isModified'];
    orderThrough = json['OrderThrough'];
    rating = json['rating'];
    rating2 = json['rating2'];
    rating3 = json['rating3'];
    distanceByRider = json['DistanceByRider'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['DeliveryOrderID'] = deliveryOrderID;
    data['OrderNo'] = orderNo;
    data['OrderStatus'] = orderStatus;
    data['BranchRiderID'] = branchRiderID;
    data['FirstName'] = firstName;
    data['Amount'] = amount;
    data['Phone1'] = phone1;
    data['bTitle'] = bTitle;
    data['Branch_Name'] = branchName;
    data['lTitle'] = lTitle;
    data['DeliveryAddress'] = deliveryAddress;
    data['StatusTitle'] = statusTitle;
    data['bFirstName'] = bFirstName;
    data['bMiddleName'] = bMiddleName;
    data['bLastName'] = bLastName;
    data['BookedDate'] = bookedDate;
    data['BookedTime'] = bookedTime;
    data['DispatchedDate'] = dispatchedDate;
    data['DispatchedTime'] = dispatchedTime;
    data['ReceivedByDate'] = receivedByDate;
    data['ReceivedByTime'] = receivedByTime;
    data['FinalStatusDate'] = finalStatusDate;
    data['FinalStatusTime'] = finalStatusTime;
    data['Instruction'] = instruction;
    data['AgentName'] = agentName;
    data['FinalStatusBy'] = finalStatusBy;
    data['CancelComment'] = cancelComment;
    data['PartialRejectComment'] = partialRejectComment;
    data['PaymentMode'] = paymentMode;
    data['RemainingMinuts2'] = remainingMinuts2;
    data['RemainingMinuts'] = remainingMinuts;
    data['MinutsToBooked'] = minutsToBooked;
    data['minutsRequiredToDelivered'] = minutsRequiredToDelivered;
    data['MinutsToBooked1'] = minutsToBooked1;
    data['IsPusshToPOS'] = isPusshToPOS;
    data['deliverOnBranch'] = deliverOnBranch;
    data['OfflineOrder'] = offlineOrder;
    data['isModified'] = isModified;
    data['OrderThrough'] = orderThrough;
    data['rating'] = rating;
    data['rating2'] = rating2;
    data['rating3'] = rating3;
    data['DistanceByRider'] = distanceByRider;
    return data;
  }
}
