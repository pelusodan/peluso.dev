import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pelusodan_dev/secrets.dart';

Future sendEmail(
    {required String name,
    required String email,
    required String message,
    required String subject}) async {
  final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
  final response = await http.post(url,
      headers: {'Content-Type': 'application/json'},
      //This line makes sure it works for all platforms.
      body: json.encode({
        'service_id': emailServiceId,
        'template_id': emailTemplateId,
        'user_id': emailUserId,
        'template_params': {
          'from_name': name,
          'from_email': email,
          'message': message,
          'subject': subject
        }
      }));
  return response.statusCode;
}
