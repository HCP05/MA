import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'client_model.freezed.dart';
part 'client_model.g.dart';

@freezed
class Client with _$Client {
  factory Client({
    int? id,
    required String name,
    required String email,
    required String phoneNumber,
    required String adress,
    required String package,
  }) = _Client;

  factory Client.fromJson(Map<String, dynamic> json) => _$ClientFromJson(json);
}
