class ServerException implements Exception{
  String? errorMessage;
  String? statusMessage;
  int? httpResponseCode;
  ServerException(
      {this.errorMessage,this.statusMessage, this.httpResponseCode});
}