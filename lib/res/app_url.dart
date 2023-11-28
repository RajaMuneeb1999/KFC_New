class AppUrl {
  /* static var baseUrl =
      "https://kfcisb.ufone.com/RiderAppService/RiderAppService";*/
  static const baseUrl =
      "https://hds.kfcpakistan.com/riderappservice/RiderAppService/"; // new mim 25-9-2023
  static var loginEndPint = '$baseUrl/riderLogin?';
  static var logoutEndPint = '$baseUrl/riderLogout?';
  static var riderRosterEndPint = '$baseUrl/getRiderRoster?';
  static var riderProfileImageEndPint = '$baseUrl/getRiderProfileImage?';
  static var riderPasswordUpdateEndPint = '$baseUrl/updateRiderPassword?';
  static var riderKPIEndPint = '$baseUrl/getRiderKPI?';
  static var getRiderWalletBalance = '$baseUrl/getRiderWalletBalance?';
  static var getRiderWalletPayments = '$baseUrl/getRiderWalletPayments?';
  static var getRiderHistory = '$baseUrl/getRiderHistory?';


}
