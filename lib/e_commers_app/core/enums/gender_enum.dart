enum Gender { male, female }

extension GenderExtension on Gender {
  String get label {
    switch (this) {
      case Gender.male:
        return "Men";
      case Gender.female:
        return "Women";
    }
  }

  static Gender fromString(String value) {
    return value.toLowerCase() == "men" ? Gender.male : Gender.female;
  }

  String toStorageString() {
    return this == Gender.male ? "men" : "women";
  }
}
