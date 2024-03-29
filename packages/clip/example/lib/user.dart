class User {
  final int? id;
  final String? name;

  final String? avatar;

  const User({required this.id, required this.name, required this.avatar});

  User.fromJson(Map<String, dynamic> item)
      : id = item['id'],
        name = item['name'],
        avatar = item['avatar'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'avatar': avatar,
      };
}
