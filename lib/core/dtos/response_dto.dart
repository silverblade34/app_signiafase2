class ApiResponse<T> {
  final bool status;
  final String message;
  final T data;

  ApiResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) {
    return ApiResponse<T>(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: fromJsonT(json['data']),
    );
  }
}