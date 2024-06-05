// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class DropdownModel extends Equatable {
  final String id;
  final String value;

  const DropdownModel({
    required this.id,
    required this.value,
  });

  DropdownModel copyWith({
    String? id,
    String? value,
  }) {
    return DropdownModel(
      id: id ?? this.id,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toJSON() {
    return <String, dynamic>{
      'id': id,
      'value': value,
    };
  }

  factory DropdownModel.fromJSON(Map<String, dynamic> map) {
    return DropdownModel(
      id: map['id'] ?? '',
      value: map['value'] ?? '',
    );
  }

  @override
  List<Object?> get props => [id, value];
}
