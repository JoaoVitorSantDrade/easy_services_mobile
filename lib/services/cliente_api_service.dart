// services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/cliente_model.dart';

class ClienteApi {
  static const String baseUrl =
      'http://192.168.101.7:8000/api'; // Substitua pelo seu URL de backend

  Future<List<ClienteModel>> fetchClientes() async {
    final response = await http.get(Uri.parse('$baseUrl/clientes/'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((data) => ClienteModel.fromJson(data)).toList();
    } else {
      throw Exception('Failed to fetch clientes');
    }
  }

  Future<ClienteModel> fetchCliente(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/clientes/$id/'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      return ClienteModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch cliente');
    }
  }

  Future<void> createCliente(ClienteModel cliente) async {
    final response = await http.post(
      Uri.parse('$baseUrl/clientes/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(cliente.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to create cliente');
    }
  }

  Future<void> updateCliente(int id, ClienteModel cliente) async {
    final response = await http.put(
      Uri.parse('$baseUrl/clientes/$id/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(cliente),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update cliente');
    }
  }

  Future<void> deleteCliente(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/clientes/$id/'));

    if (response.statusCode != 204) {
      throw Exception('Failed to delete cliente');
    }
  }

  Future<Map<String, dynamic>> loginCliente(
      String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/token/'),
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

  Future<void> logoutCliente(String refreshToken) async {
    final response = await http.post(
      Uri.parse('$baseUrl/logout/'),
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
