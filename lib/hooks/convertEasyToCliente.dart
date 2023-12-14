import 'package:easy_services/models/cliente_model.dart';
import 'package:easy_services/models/easyAddressModel.dart';
import 'package:easy_services/models/easyUserModel.dart';

ClienteModel convert(easyUserModel eUser) {
  ClienteModel newClient = ClienteModel(
    id: eUser.userId,
    nome: eUser.name,
    email: eUser.email,
    username: eUser.name,
    password: eUser.password,
    rg: eUser.rg!,
    cpf: eUser.cpf!,
    dataNascimento: eUser.dataNascimento!,
    cep: eUser.endereco!,
    endereco: eUser.endereco!,
    numeroCasa: eUser.numeroCasa!,
    cidade: eUser.cidade!,
    bairro: eUser.bairro!,
    telefone: eUser.telefone!,
    user_type: eUser.userType,
  );
  return newClient;
}

easyUserModel clienteModelToEasyUserModel(ClienteModel clienteModel) {
  easyUserModel user = easyUserModel(
    userId: clienteModel.id,
    name: clienteModel.nome,
    email: clienteModel.email,
    password: clienteModel.password,
    userType:
        clienteModel.user_type, // Replace with the appropriate default value
  );

  user.setAdditionalProperties(
    clienteModel.rg,
    clienteModel.cpf,
    clienteModel.dataNascimento,
    clienteModel.telefone,
  );

  user.setAddressProperties(
    clienteModel.bairro,
    clienteModel.cidade,
    clienteModel.endereco,
    clienteModel.numeroCasa,
  );

  return user;
}
