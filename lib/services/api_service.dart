  import 'dart:convert';
  import 'package:http/http.dart' as http;
  import '../models/event.dart';

  class ApiService {
    final String baseUrl = "http://127.0.0.1:8000/api/";

    Future<List<Event>> fetchEvents() async {
      final response = await http.get(Uri.parse("${baseUrl}events/"));
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(utf8.decode(response.bodyBytes));
        return jsonResponse.map((event) => Event.fromJson(event)).toList();
      } else {
        throw Exception('Failed to load events');
      }
    }

    Future<void> registerForEvent(
        int eventId,
        String firstName,
        String lastName,
        String email,
        String phoneNumber,
        DateTime birthDate,
        String gender) async {
      final response = await http.post(
        Uri.parse("${baseUrl}registrations/"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'event': eventId,
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'phone_number': phoneNumber,
          'birth_date': birthDate.toIso8601String().split('T').first,
          'gender': gender,
        }),
      );

      if (response.statusCode != 201) {
        print('Failed to register for event: ${response.body}');
        throw Exception('Failed to register for event');
      }
    }
  }
