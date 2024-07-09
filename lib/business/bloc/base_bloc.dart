import 'dart:async';

import 'package:flutter_elo7/models/dto/base_dto.dart';
import 'package:flutter_elo7/models/dto/error_model.dart';
import 'package:flutter_elo7/models/dto/resources_result.dart';

/*
Classe adaptada do projeto: https://github.com/Anonymousgaurav/bloc_clean_architecture/tree/develop/futter_db
Partes do código pertencem a Gaurav Kumar.
*/
abstract class BaseBloc<In extends BaseDTO, Out> {
  final StreamController<ResourceResult<Out>> controller =
      StreamController<ResourceResult<Out>>();

  Stream<ResourceResult<Out>>? get dataStream => this.controller.stream;

  void performOperation(In dto);

  void processData(ResourceResult<Out>? data) {
    if (!this.controller.isClosed && data != null) {
      this.controller.sink.add(data);
    }
  }

  void dispose() {
    this.controller.close();
  }

  ResourceResult<Out> buildResult({Out? data, int code = -1}) {
    ResourceResult<Out> res = ResourceResult();

    res.data = data;
    res.state = res.hasData() ? ResourceState.SUCCESS : ResourceState.ERROR;
    res.error = (res.isError() ? ErrorModel(code: code) : null);

    return res;
  }
}
