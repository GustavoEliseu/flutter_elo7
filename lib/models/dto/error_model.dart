import 'package:flutter_elo7/business/error_codes.dart';
import 'package:flutter_elo7/models/base_model.dart';

/*
Classe adaptada do projeto: https://github.com/Anonymousgaurav/bloc_clean_architecture/tree/develop/futter_db
Partes do código pertencem a Gaurav Kumar.
*/
class ErrorModel implements BaseModel {
  int? code;
  String trace;

  ErrorModel({this.code, this.trace = ""});

  bool isSessionError() => (code == ErrorCodes.API_ERROR);
}
