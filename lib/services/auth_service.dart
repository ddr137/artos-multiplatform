import 'dart:convert';

import 'package:artos/models/sign_in_form_model.dart';
import 'package:artos/models/sign_up_form_model.dart';
import 'package:artos/shared/shared_values.dart';
import 'package:http/http.dart' as http;

import '../models/user_model.dart';

class AuthService {
  Future<bool> checkEmail(String email) async {
    try {
      final res = await http
          .post(Uri.parse('$baseUrl/is-email-exist'), body: {'email': email});

      if (res.statusCode == 200) {
        return jsonDecode(res.body)['is_email_exist'];
      } else {
        return jsonDecode(res.body)['errors'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> register(SignUpFormModel data) async {
    try {
      final res = await http.post(
        Uri.parse(
          '$baseUrl/register',
        ),
        body: data.toJson(),
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        final user = UserModel.fromJson(jsonDecode(res.body));
        user.copyWith(password: data.password);

        return user;
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> login(SignInFormModel data) async {
    try {
      final res = await http.post(
        Uri.parse(
          '$baseUrl/login',
        ),
        body: data.toJson(),
      );

      if (res.statusCode == 200) {
        final user = UserModel.fromJson(jsonDecode(res.body));
        user.copyWith(password: data.password);

        return user;
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
