part of 'services.dart';

class AuthService {
  Future<bool> checkEmail(String email) async {
    try {
      final res = await http.post(
        Uri.parse('$baseUrl/is-email-exist'),
        body: {
          'email': email,
        },
      );

      if (res.statusCode == 200) {
        return jsonDecode(res.body)['is_email_exist'];
      } else {
        final error = jsonDecode(res.body)['errors']['email'][0] ??
            'something went wrong';
        throw (error);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> register(SignUpFormModel payload) async {
    try {
      final res = await http.post(
        Uri.parse('$baseUrl/register'),
        body: payload.toJson(),
      );

      if (res.statusCode == 200) {
        UserModel user = UserModel.fromJson(jsonDecode(res.body));
        user = user.copyWith(
          password: payload.password,
        );

        await storeCredentials(user);

        return user;
      } else {
        final error = jsonDecode(res.body)['message'] ?? 'something went wrong';
        throw (error);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> login(SignInFormModel payload) async {
    try {
      final res = await http.post(
        Uri.parse('$baseUrl/login'),
        body: payload.toJson(),
      );

      if (res.statusCode == 200) {
        UserModel user = UserModel.fromJson(jsonDecode(res.body));
        user = user.copyWith(
          password: payload.password,
        );

        await storeCredentials(user);

        return user;
      } else {
        final error = jsonDecode(res.body)['message'] ?? 'something went wrong';
        throw (error);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> storeCredentials(UserModel user) async {
    try {
      const storage = FlutterSecureStorage();
      await storage.write(key: 'token', value: user.token);
      await storage.write(key: 'email', value: user.email);
      await storage.write(key: 'password', value: user.password);
    } catch (e) {
      rethrow;
    }
  }

  Future<SignInFormModel> getCredentials() async {
    try {
      const storage = FlutterSecureStorage();
      Map<String, String> values = await storage.readAll();

      if (values['email'] == null || values['password'] == null) {
        throw 'authenticated';
      } else {
        final SignInFormModel data = SignInFormModel(
          email: values['email'],
          password: values['password'],
        );

        return data;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getToken() async {
    String token = '';

    const storage = FlutterSecureStorage();

    String? value = await storage.read(key: 'token');

    if (value != null) {
      token = "Bearer $value";
    }

    return token;
  }

  Future<void> clearLocalStorage() async {
    const storage = FlutterSecureStorage();

    await storage.deleteAll();
  }
}
