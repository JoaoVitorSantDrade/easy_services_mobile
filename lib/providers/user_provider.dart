import 'package:easy_services/models/easyAddressModel.dart';
import 'package:easy_services/models/easyUserModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final easyUserProvider =
    StateProvider<easyUserModel>((ref) => easyUserModel.empty());

final easyAddressProvider =
    StateProvider<easyAddressModel>((ref) => easyAddressModel.empty());
