class LogInModel {
  int? branchRiderID;
  int? branchID;
  String? firstName;
  String? middleName;
  String? lastName;
  dynamic blat;
  dynamic blon;
  String? responce;

  LogInModel(
      {this.branchRiderID,
      this.branchID,
      this.firstName,
      this.middleName,
      this.lastName,
      this.blat,
      this.blon,
      this.responce});

  LogInModel.fromJson(Map<String, dynamic> json) {
    branchRiderID = json['BranchRiderID'];
    branchID = json['BranchID'];
    firstName = json['FirstName'];
    middleName = json['MiddleName'];
    lastName = json['LastName'];
    blat = json['blat'];
    blon = json['blon'];
    responce = json['Responce'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['BranchRiderID'] = branchRiderID;
    data['BranchID'] = branchID;
    data['FirstName'] = firstName;
    data['MiddleName'] = middleName;
    data['LastName'] = lastName;
    data['blat'] = blat;
    data['blon'] = blon;
    data['Responce'] = responce;
    return data;
  }
}
