// models/prestador_model.dart
class PrestadorModel {
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
  final String antecedentesCriminais;

  PrestadorModel({
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
    required this.antecedentesCriminais,
  });

  factory PrestadorModel.fromJson(Map<String, dynamic> json) {
    return PrestadorModel(
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
      antecedentesCriminais: json['antecedentes_criminais'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
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
    };
  }
}


// acho melhor tirar a parte de antecedentes

// ele seria um arquivo pdf/imagem