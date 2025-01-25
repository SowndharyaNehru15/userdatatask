
class UserModel {
  final int id;
  final int userId;
  final String title;
  final bool completed;

  UserModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.completed,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      completed: json['completed'],
    );
  }
}
