
class User{
  int id;
  String username;
  String email;
  String notelepon;
  int level;
  String created_at;

  User ({required this.id,required this.username, required this.email, required this.notelepon, required this.level, required this.created_at});

  User.fromJson(Map<String,dynamic> json)
  : id = json['id'],
    username = json['username'],
    email = json['email'],
    notelepon = json['notelepon'],
    level = json['level'],
    created_at = json['created_at'];
}
