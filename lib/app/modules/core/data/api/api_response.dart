class ApiResponse<T> {
  final T? data;
  final String? message;
  final double? progress;

  ApiResponse({
    this.data,
    this.message,
    this.progress,
  });

  ApiResponse<T> copyWith({
    T? data,
    int? statusCode,
    String? message,
    double? progress,
  }) =>
      ApiResponse(
        data: data ?? this.data,
        message: message ?? this.message,
        progress: progress ?? this.progress,
      );
}
