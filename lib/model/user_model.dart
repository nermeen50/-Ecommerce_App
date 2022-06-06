class UserModel {
  final String? userId;
  final String? email;
  final String? name;
  final String? pic;
  UserModel({this.userId, this.email, this.name, this.pic});
  factory UserModel.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return UserModel();
    } else {
      return UserModel(
        userId: json['userId'],
        email: json['email'],
        name: json['name'],
        pic: json['pic'],
      );
    }
  }
  Map<String, dynamic> toJson() {
    return {
      "userId": userId,
      "email": email,
      "name": name,
      "pic": pic,
    };
  }
}
