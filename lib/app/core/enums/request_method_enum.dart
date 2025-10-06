enum RequestMethodEnum {
  get('GET'),
  post('POST'),
  delete('DELETE'),
  put('PUT');

  final String _value;

  const RequestMethodEnum(this._value);

  String get value => _value;
}
