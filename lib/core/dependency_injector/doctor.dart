typedef InstanceCreator<T> = T Function();

final doctor = Doctor();

class Doctor {
  Doctor._();

  static final _singleton = Doctor._();

  factory Doctor() => _singleton;

  final _instanceMap = <Type, _InstanceGenerator<Object>>{};

  void instance<T extends Object>(
    InstanceCreator<T> instance,
  ) =>
      _instanceMap[T] = _InstanceGenerator(
        instance,
        false,
      );

  T call<T extends Object>() {
    final instance = _instanceMap[T]?.getInstance();
    if (instance is T) return instance;
    throw Exception('[ERROR] -> Instance ${T.toString()} not found.');
  }

  void singleton<T extends Object>(
    InstanceCreator<T> instance,
  ) =>
      _instanceMap[T] = _InstanceGenerator(
        instance,
        true,
      );
}

class _InstanceGenerator<T> {
  T? _instance;

  bool _isFirstGet = false;

  final InstanceCreator<T> _instanceCreator;
  _InstanceGenerator(this._instanceCreator, bool isSingleton) : _isFirstGet = isSingleton;

  T? getInstance() {
    if (_isFirstGet) {
      _instance = _instanceCreator();
      _isFirstGet = false;
    }
    return _instance ?? _instanceCreator();
  }
}
