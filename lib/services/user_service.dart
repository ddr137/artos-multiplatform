import 'dart:convert';

import 'package:artos/models/user_edit_form_model.dart';
import 'package:artos/services/auth_service.dart';
import 'package:artos/shared/shared_values.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future<void> updateUser(UserEditFormModel data) async {
    try {
      final token = await AuthService().getToken();

      final res = await http.put(
        Uri.parse('$baseUrl/users'),
        body: data.toJson(),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }

    } catch (e) {
      rethrow;
    }
  }
}
