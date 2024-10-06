// ignore: camel_case_types
class usermodel {
  String? sId;
  String? name;

  usermodel({this.sId, this.name});

  usermodel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    return data;
  }
}
