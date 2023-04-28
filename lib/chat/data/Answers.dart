class Answers {
  Answers({
      required this.owner,
      required this.a,});

  Answers.fromJson(dynamic json) {
    owner = json['owner'];
    a = json['a'];
  }
  String owner="";
  String a="";

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['owner'] = owner;
    map['a'] = a;
    return map;
  }

}