
class User{
  String username;
  String email;
  String notelepon;
  int level;

  User ({required this.username, required this.email, required this.notelepon, required this.level});

  User.fromJson(Map<String,dynamic> json)
  : username = json['username'],
    email = json['email'],
    notelepon = json['notelepon'],
    level = json['level'];
}
