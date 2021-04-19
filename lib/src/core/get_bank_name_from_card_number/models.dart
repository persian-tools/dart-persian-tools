/// the model class for showing bank informations
class Bank {
  const Bank({this.name, this.initCode});

  /// Bank name
  final String? name;

  /// Refers to the first six digits of the card number
  final String? initCode;

  Bank copyWith({
    String? name,
    String? initCode,
  }) =>
      Bank(
        name: name ?? this.name,
        initCode: initCode ?? this.initCode,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Bank &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          initCode == other.initCode;

  @override
  int get hashCode => name.hashCode ^ initCode.hashCode;

  @override
  String toString() {
    return 'Bank{name: $name, initCode: $initCode}';
  }
}
