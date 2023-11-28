class RosterList {
  final List<RosterModel> products;

  RosterList({required this.products});

  factory RosterList.fromJson(List<dynamic> parsedJson) {
    List<RosterModel> cities = List<RosterModel>.empty();
    RosterModel city = RosterModel();
    cities = parsedJson.map((i) => RosterModel.fromJson(i)).toList();
    cities.add(city);
    return RosterList(products: cities);
  }
}


class RosterModel {
  String? column1;
  String? startDateTime;
  String? endDateTime;

  RosterModel({this.column1, this.startDateTime, this.endDateTime});

  RosterModel.fromJson(Map<String, dynamic> json) {
    column1 = json['Column1'];
    startDateTime = json['startDateTime'];
    endDateTime = json['endDateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Column1'] = column1;
    data['startDateTime'] = startDateTime;
    data['endDateTime'] = endDateTime;
    return data;
  }
}
