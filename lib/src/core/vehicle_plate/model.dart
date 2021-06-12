class NormalizedPlate {
  String numbers;
  String? char;

  NormalizedPlate(this.numbers, [this.char]);
}

class PlateInfo {
  String template;
  String? province;
  String type;
  String? category;

  PlateInfo({
    required this.template,
    this.province,
    required this.type,
    this.category,
  });
}
