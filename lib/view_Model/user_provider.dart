import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:demouserapp/utils.dart';


class UserViewModel extends ChangeNotifier {
  List<UserModel> _users = [];
  bool _isLoading = true;

  List<UserModel> get users => _users;
  bool get isLoading => _isLoading;

  Future<void> fetchUsers() async {
    _isLoading = true;
    notifyListeners();

    try {
      final url = Uri.parse('https://jsonplaceholder.typicode.com/todos?userId=2');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);

        _users = data.map((json) => UserModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to fetch users');
      }
    } catch (e) {
      debugPrint('Error fetching users: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
}
