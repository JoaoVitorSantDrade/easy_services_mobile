// models/cliente_model.dart
class ClienteModel {
  final int id;
  final String nome;
  final String email;
  final String username;
  final String password;
  final String rg;
  final String cpf;
  final String dataNascimento;
  final String cep;
  final String endereco;
  final String numeroCasa;
  final String cidade;
  final String bairro;
  final String telefone;
  final String user_type;

  ClienteModel({
    required this.id,
    required this.nome,
    required this.email,
    required this.username,
    required this.password,
    required this.rg,
    required this.cpf,
    required this.dataNascimento,
    required this.cep,
    required this.endereco,
    required this.numeroCasa,
    required this.cidade,
    required this.bairro,
    required this.telefone,
    required this.user_type,
  });

  factory ClienteModel.fromJson(Map<String, dynamic> json) {
    return ClienteModel(
      id: json['id'],
      nome: json['nome'],
      email: json['email'],
      username: json['username'],
      password: json['password'],
      rg: json['rg'],
      cpf: json['cpf'],
      dataNascimento: json['data_nascimento'],
      cep: json['cep'],
      endereco: json['endereco'],
      numeroCasa: json['numero_casa'],
      cidade: json['cidade'],
      bairro: json['bairro'],
      telefone: json['telefone'],
      user_type: json['user_type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'username': username,
      'password': password,
      'rg': rg,
      'cpf': cpf,
      'data_nascimento': dataNascimento,
      'cep': cep,
      'endereco': endereco,
      'numero_casa': numeroCasa,
      'cidade': cidade,
      'bairro': bairro,
      'telefone': telefone,
      'user_type': user_type,
    };
  }
}
