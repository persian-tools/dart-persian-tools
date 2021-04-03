enum SimCardType {
  credit,
  permanent,
  both,
}

class Operator {
  Operator(
    this.provinces,
    this.base,
    this.model,

    this.type,
  );

  final List<String>? provinces;
  final String base;
  final String? model;
  final SimCardType type;
}
