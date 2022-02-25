class UserModel {
  String? id, fullName, email, pic;

  UserModel(
      {required this.id,
      required this.fullName,
      required this.email,
      this.pic = 'default'});

  UserModel.fromJson(Map<dynamic, dynamic> map) {
    id = map['id'];
    fullName = map['fullName'];
    email = map['email'];
    pic = map['pic'];
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
