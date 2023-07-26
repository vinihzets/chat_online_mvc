class UserModel {
  String name;
  String id;
  String email;

  UserModel({required this.name, required this.id, required this.email});

  factory UserModel.fromMap(dynamic map) {
    return UserModel(name: map['name'], id: map['id'], email: map['email']);
  }

  toMap(UserModel entity) {
    return {
      'name': entity.name,
      'id': entity.id,
      'email': entity.email,
    };
  }
}
