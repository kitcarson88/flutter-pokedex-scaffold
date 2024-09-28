import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_dto.freezed.dart';
part 'pagination_dto.g.dart';

@Freezed(genericArgumentFactories: true)
class PaginationDTO<T> with _$PaginationDTO<T> {
  const factory PaginationDTO({
    @Default(null) int? count,
    @Default(null) String? next,
    @Default(null) String? previous,
    @Default(null) List<T>? results,
  }) = _PaginationDTO;

  factory PaginationDTO.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$PaginationDTOFromJson(json, fromJsonT);
}
