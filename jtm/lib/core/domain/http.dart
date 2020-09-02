
class HttpError {
  final int status;
  final String error;
  final String message;

  HttpError(this.status, this.error, this.message);

  HttpError.fromJson(Map<String, dynamic> json)
            : status = json['status'],
              error = json['error'],
              message = json['message'];
}