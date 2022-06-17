class ServicesSuccess {
  int? code;
  dynamic msg;
  dynamic data;

  ServicesSuccess({
    this.code,
    this.msg,
    this.data,
  });
}

class ServicesFailure {
  int? code;
  dynamic errMsg;

  ServicesFailure({
    this.code,
    this.errMsg,
  });
}
