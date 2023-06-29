
class User{
  late String username;
  late String email;
  late String notelepon;
  late int level;

  User ({required this.username, required this.email, required this.notelepon, required this.level});

  User.fromJson(Map<String,dynamic> json)
  : username = json['username'],
    email = json['email'],
    notelepon = json['notelepon'],
    level = json['level'];
}
