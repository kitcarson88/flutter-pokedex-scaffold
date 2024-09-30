// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Stat {
  final String name;
  final int value;
  const Stat({
    required this.name,
    required this.value,
  });

  Stat copyWith({
    String? name,
    int? value,
  }) =>
      Stat(
        name: name ?? this.name,
        value: value ?? this.value,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'name': name,
        'value': value,
      };

  factory Stat.fromMap(Map<String, dynamic> map) => Stat(
        name: (map['name'] ?? '') as String,
        value: (map['value'] ?? 0) as int,
      );

  String toJson() => json.encode(toMap());

  factory Stat.fromJson(String source) => Stat.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Stat(name: $name, value: $value)';

  @override
  bool operator ==(covariant Stat other) {
    if (identical(this, other)) return true;

    return other.name == name && other.value == value;
  }

  @override
  int get hashCode => name.hashCode ^ value.hashCode;
}
