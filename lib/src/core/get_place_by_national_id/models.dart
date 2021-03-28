abstract class Place {
  const Place({required this.code});

  final int code;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Place && runtimeType == other.runtimeType && code == other.code;

  @override
  int get hashCode => code.hashCode;
}

class Province extends Place {
  const Province({
    int? code,
    this.name,
  }) : super(code: code ?? 0);

  final String? name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Province &&
          runtimeType == other.runtimeType &&
          code == other.code &&
          name == other.name;

  @override
  int get hashCode => code.hashCode ^ name.hashCode;

  @override
  String toString() {
    return 'Province{code: $code, name: $name}';
  }
}

class City extends Place {
  const City({
    int? code,
    this.name,
    this.province,
  }) : super(code: code ?? 0);

  final String? name;
  final Province? province;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is City &&
          runtimeType == other.runtimeType &&
          code == other.code &&
          name == other.name &&
          province == other.province;

  @override
  int get hashCode => code.hashCode ^ name.hashCode ^ province.hashCode;

  @override
  String toString() {
    return 'City{code: $code, name: $name, province: $province}';
  }
}

class NationalIdPlace {
  const NationalIdPlace({
    required this.codes,
    required this.city,
    required this.province,
  });

  factory NationalIdPlace.fromStringCodes({
    required String codes,
    required City city,
    required Province province,
  }) =>
      NationalIdPlace(
        codes: codes.split('-'),
        city: city,
        province: province,
      );

  final List<String> codes;
  final City city;
  final Province province;

  String get codesAsString => codes.join('-');

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NationalIdPlace &&
          runtimeType == other.runtimeType &&
          codes == other.codes &&
          city == other.city &&
          province == other.province;

  @override
  int get hashCode => codes.hashCode ^ city.hashCode ^ province.hashCode;

  @override
  String toString() {
    return 'NationalIdPlace{codes: $codes, city: $city, province: $province}';
  }
}
