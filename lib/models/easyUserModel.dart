class easyUserModel {
  int userId;
  String name;
  String email;
  String password;
  String userType;

  String? rg;
  String? cpf;
  String? dataNascimento;
  String? telefone;

  String? bairro;
  String? cidade;
  String? endereco;
  String? numeroCasa;

  easyUserModel({
    required this.userId,
    required this.name,
    required this.email,
    required this.password,
    required this.userType,
  });

  easyUserModel.empty() // pra ter um construtor vazio, faz assim
      : userId = -1,
        name = '',
        email = '',
        password = '',
        userType = '';

  factory easyUserModel.fromJson(Map<String, dynamic> json) => easyUserModel(
        userId: int.parse(json['user_id']),
        name: json['name'],
        email: json['email'],
        password: json['password'],
        userType: json['user_type'],
      );

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'name': name,
        'email': email,
        'password': password,
        'user_type': userType,
      };

  void setAdditionalProperties(
    String? rg,
    String? cpf,
    String? dataNascimento,
    String? telefone,
  ) {
    this.rg = rg ?? '';
    this.cpf = cpf ?? '';
    this.dataNascimento = dataNascimento ?? '';
    this.telefone = telefone ?? '';
  }

  void setAddressProperties(
    String? bairro,
    String? cidade,
    String? endereco,
    String? numeroCasa,
  ) {
    this.bairro = bairro ?? '';
    this.cidade = cidade ?? '';
    this.endereco = endereco ?? '';
    this.numeroCasa = numeroCasa ?? '';
  }
}
