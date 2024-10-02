// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Switch {
  final int id;
  final String value;
  bool enabled;

  Switch({
    required this.id,
    required this.value,
    required this.enabled,
  });

  Switch copyWith({
    int? id,
    String? value,
    bool? enabled,
  }) =>
      Switch(
        id: id ?? this.id,
        value: value ?? this.value,
        enabled: enabled ?? this.enabled,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'value': value,
        'enabled': enabled,
      };

  factory Switch.fromMap(Map<String, dynamic> map) => Switch(
        id: (map['id'] ?? 0) as int,
        value: (map['value'] ?? '') as String,
        enabled: (map['enabled'] ?? false) as bool,
      );

  String toJson() => json.encode(toMap());

  factory Switch.fromJson(String source) =>
      Switch.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Switch(id: $id, value: $value, enabled: $enabled)';

  @override
  bool operator ==(covariant Switch other) {
    if (identical(this, other)) return true;

    return other.id == id && other.value == value && other.enabled == enabled;
  }

  @override
  int get hashCode => id.hashCode ^ value.hashCode ^ enabled.hashCode;
}
