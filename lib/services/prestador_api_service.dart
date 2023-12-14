// services/prestador_api.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/prestador_model.dart';

class PrestadorApi {
  static const String baseUrl =
      'http://127.0.0.1:8000/api'; // Substitua pelo seu URL de backend

  Future<List<PrestadorModel>> fetchPrestadores() async {
    final response = await http.get(Uri.parse('$baseUrl/prestadores/'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((data) => PrestadorModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to fetch prestadores');
    }
  }

  Future<PrestadorModel> fetchPrestador(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/prestadores/$id/'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      return PrestadorModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch prestador');
    }
  }

  Future<void> createPrestador(PrestadorModel prestador) async {
    final response = await http.post(
      Uri.parse('$baseUrl/prestadores/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(prestador),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create prestador');
    }
  }

  Future<void> updatePrestador(int id, PrestadorModel prestador) async {
    final response = await http.put(
      Uri.parse('$baseUrl/prestadores/$id/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(prestador),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update prestador');
    }
  }

  Future<void> deletePrestador(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/prestadores/$id/'));

    if (response.statusCode != 204) {
      throw Exception('Failed to delete prestador');
    }
  }

  Future<Map<String, dynamic>> loginPrestador(
      String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/prestadores/token/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<void> logoutPrestador(String refreshToken) async {
    final response = await http.post(
      Uri.parse('$baseUrl/prestadores/logout/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'refresh_token': refreshToken,
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to logout');
    }
  }
}
