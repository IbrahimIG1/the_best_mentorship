class ErrorModel {
  final int? statusCode;
  final String? message;
  final Map<String, List<String>>? errors;

  ErrorModel({
    this.statusCode,
    this.message,
    this.errors,
  });

  /// Factory constructor to parse from JSON
  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      statusCode: json['statusCode'] as int?,
      message: json['message'] as String?,
      errors: (json['errors'] as Map<String, dynamic>?)?.map(
        (key, value) => MapEntry(
          key,
          (value as List).map((e) => e.toString()).toList(),
        ),
      ),
    );
  }

  /// Convert model to JSON (optional)
  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'message': message,
      'errors': errors,
    };
  }

  /// Helper to get a flattened error string
  String get firstErrorMessage {
    if (errors == null || errors!.isEmpty) {
      return message ?? 'Unknown error';
    }
    final firstKey = errors!.keys.first;
    final firstList = errors![firstKey];
    return firstList != null && firstList.isNotEmpty
        ? firstList.first
        : message ?? 'Unknown error';
  }

  /// Combine all messages into one string (for toasts/logs)
  String get allErrorsAsString {
    if (errors == null || errors!.isEmpty) {
      return message ?? 'Unknown error';
    }
    return errors!.entries
        .map((entry) => '${entry.key}: ${entry.value.join(", ")}')
        .join('\n');
  }

  @override
  String toString() {
    return 'ErrorModel(statusCode: $statusCode, message: $message, errors: $errors)';
  }
}
