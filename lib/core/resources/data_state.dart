class DataState<T> {
  T? data;
  String? error;

  DataState(this.data, this.error);
}

class DataSuccess<T> extends DataState<T> {
  DataSuccess(T? data) : super(data, null);
}

class DataFailed<T> extends DataState<T> {
  DataFailed(String? error) : super(null, error);
}
