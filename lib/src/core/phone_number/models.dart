import 'package:persian_tools/src/constants/phone_number/constants.dart';

enum SimCardType {
  credit,
  permanent,
  both,
}

class OperatorDetail {
  const OperatorDetail({
    required this.base,
    this.provinces,
    this.model,
    this.type = SimCardType.both,
    this.operator,
  });

  final String base;
  final List<String>? provinces;
  final String? model;
  final SimCardType type;
  final Operator? operator;

  String? get name => operator?.name;

  OperatorDetail copyWith({
    String? base,
    List<String>? provinces,
    String? model,
    SimCardType? type,
    Operator? operator,
  }) =>
      OperatorDetail(
        base: base ?? this.base,
        provinces: provinces ?? this.provinces,
        model: model ?? this.model,
        type: type ?? this.type,
        operator: operator ?? this.operator,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OperatorDetail &&
          runtimeType == other.runtimeType &&
          base == other.base &&
          provinces == other.provinces &&
          model == other.model &&
          type == other.type &&
          operator == other.operator;

  @override
  int get hashCode =>
      base.hashCode ^
      provinces.hashCode ^
      model.hashCode ^
      type.hashCode ^
      operator.hashCode;

  @override
  String toString() {
    return 'OperatorDetail{base: $base, provinces: $provinces, model: $model, type: $type, operator: $operator}';
  }
}

class Operator {
  const Operator._(this.name);

  final String name;

  static const shatelMobile = Operator._(shatelName);
  static const MCI = Operator._(MCIName);
  static const irancell = Operator._(irancellName);
  static const taliya = Operator._(taliaName);
  static const rightTel = Operator._(rightTelName);
  static const samanTel = Operator._(samanTelName);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Operator &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() {
    return 'Operator{name: $name}';
  }
}
