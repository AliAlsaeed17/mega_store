class User {
  String id, fullName, email, pic;

  User(
      {required this.id,
      required this.fullName,
      required this.email,
      required this.pic});

  fromJson(Map<dynamic, dynamic> map) {
    if (map == null) return;
    return User(
      id: map['id'],
      fullName: map['fullName'],
      email: map['email'],
      pic: map['pic'],
    );
  }

  toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'pic': pic,
    };
  }
}
