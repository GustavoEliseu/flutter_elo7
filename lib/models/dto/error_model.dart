import 'package:flutter_elo7/business/error_codes.dart';
import 'package:flutter_elo7/models/base_model.dart';

class ErrorModel implements BaseModel {
  int? code;
  String trace;

  ErrorModel({this.code, this.trace = ""});

  bool isSessionError() => (code == ErrorCodes.API_ERROR);
}
