class easyAddressModel {
  int userId;
  String endereco;
  String numeroCasa;
  String cidade;
  String bairro;

  easyAddressModel({
    required this.userId,
    required this.endereco,
    required this.numeroCasa,
    required this.cidade,
    required this.bairro,
  });

  easyAddressModel.empty()
      : userId = -1,
        endereco = '',
        numeroCasa = '',
        cidade = '',
        bairro = '';

  factory easyAddressModel.fromJson(Map<String, dynamic> json) =>
      easyAddressModel(
        userId: json['userId'],
        endereco: json['endereco'],
        numeroCasa: json['numero_casa'],
        cidade: json['cidade'],
        bairro: json['bairro'],
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'endereco': endereco,
        'numero_casa': numeroCasa,
        'cidade': cidade,
        'bairro': bairro,
      };
}
