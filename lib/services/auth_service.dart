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
}
