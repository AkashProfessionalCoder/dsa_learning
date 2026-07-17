class SingletonEx {
  late final String _value;
  SingletonEx._() {
    _value = "Value";
  }

  static final _instance = SingletonEx._();

  factory SingletonEx() => _instance;

  // Singletone get value
  String get value => _value;
}
