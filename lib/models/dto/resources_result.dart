import 'package:flutter_elo7/models/dto/error_model.dart';

/*
Classe adaptada do projeto: https://github.com/Anonymousgaurav/bloc_clean_architecture/tree/develop/futter_db
Partes do código pertencem a Gaurav Kumar.
*/
class ResourceResult<T> {
  ResourceState? state;
  T? data;
  ErrorModel? error;

  ResourceResult({this.state = ResourceState.LOADING, this.data, this.error});

  bool _validData() => this.data != null;

  bool _validError() => this.error != null;

  bool _isIterable() => this._validData() && (this.data is Iterable);

  bool hasDataButEmpty() =>
      (this._isIterable()) && ((this.data as Iterable).isEmpty);

  bool hasData() => this._validData();

  bool hasError() => !this._validData() && this._validError();

  bool isSuccess() => this.state == ResourceState.SUCCESS;

  bool isError() => this.state == ResourceState.ERROR;
}

/**
 * Enumeration for result states
 */
enum ResourceState { INITIAL, LOADING, SUCCESS, ERROR }
