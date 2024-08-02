class User {
  String firstName;
  String lastName;
  String avatar; //profile image
  String email;
  String id;

  User(this.firstName, this.lastName, this.avatar, this.email, this.id);

  factory User.fromJson(dynamic json) {
    return User(
        json['firstName'] as String,
        json['lastName'] as String,
        json['avatar'] as String,
        json['email'] as String,
        json['id'] as String);
  }
}
