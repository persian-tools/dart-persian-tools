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
      base.hashCode ^ provinces.hashCode ^ model.hashCode ^ type.hashCode ^ operator.hashCode;

  @override
  String toString() {
    return 'OperatorDetail{base: $base, provinces: $provinces, model: $model, type: $type, operator: $operator}';
  }
}

class Operator {
  const Operator._(this.name);

  final String name;

  static const shatelMobile = Operator._('شاتل موبایل');
  static const MCI = Operator._('همراه اول');
  static const Irancell = Operator._('ایرانسل');
  static const Taliya = Operator._('تالیا');
  static const RightTel = Operator._('رایتل');

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Operator && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() {
    return 'Operator{name: $name}';
  }
}
